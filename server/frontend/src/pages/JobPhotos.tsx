import React, { useState } from 'react';
import { useParams } from 'react-router-dom';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import {
    Box,
    Container,
    Typography,
    Tab,
    Tabs,
    Dialog,
    DialogContent,
    IconButton,
    Alert,
    Snackbar,
    Paper,
} from '@mui/material';
import CloseIcon from '@mui/icons-material/Close';
import PhotoUpload from '../components/PhotoUpload';
import PhotoGallery from '../components/PhotoGallery';
import PhotoComparison from '../components/PhotoComparison';
import photoService, { PhotoUploadResponse } from '../services/photoService';

interface TabPanelProps {
    children?: React.ReactNode;
    index: number;
    value: number;
}

const TabPanel: React.FC<TabPanelProps> = ({ children, value, index }) => (
    <div role="tabpanel" hidden={value !== index}>
        {value === index && <Box sx={{ py: 3 }}>{children}</Box>}
    </div>
);

const JobPhotos: React.FC = () => {
    const { jobId = '' } = useParams<{ jobId: string }>();
    const [activeTab, setActiveTab] = useState(0);
    const [comparisonPhoto, setComparisonPhoto] = useState<{
        before: PhotoUploadResponse;
        after: PhotoUploadResponse;
    } | null>(null);
    const [snackbar, setSnackbar] = useState<{
        open: boolean;
        message: string;
        severity: 'success' | 'error';
    }>({
        open: false,
        message: '',
        severity: 'success',
    });

    const queryClient = useQueryClient();

    // Fetch photos
    const { data: photos, isLoading } = useQuery({
        queryKey: ['jobPhotos', jobId],
        queryFn: () => photoService.getJobPhotos(jobId, true),
    });

    // Upload mutation
    const uploadMutation = useMutation({
        mutationFn: (params: { files: File[]; type: 'before' | 'after' }) =>
            photoService.uploadJobPhotos(jobId, params.files, params.type),
        onSuccess: () => {
            queryClient.invalidateQueries(['jobPhotos', jobId]);
            setSnackbar({
                open: true,
                message: 'Photos uploaded successfully',
                severity: 'success',
            });
        },
        onError: () => {
            setSnackbar({
                open: true,
                message: 'Error uploading photos',
                severity: 'error',
            });
        },
    });

    // Delete mutation
    const deleteMutation = useMutation({
        mutationFn: (photoId: string) => photoService.deletePhoto(jobId, photoId),
        onSuccess: () => {
            queryClient.invalidateQueries(['jobPhotos', jobId]);
            setSnackbar({
                open: true,
                message: 'Photo deleted successfully',
                severity: 'success',
            });
        },
        onError: () => {
            setSnackbar({
                open: true,
                message: 'Error deleting photo',
                severity: 'error',
            });
        },
    });

    const handleUpload = async (files: File[], type: 'before' | 'after') => {
        uploadMutation.mutate({ files, type });
    };

    const handleDelete = async (photoId: string) => {
        deleteMutation.mutate(photoId);
    };

    const handleCompare = (before: PhotoUploadResponse, after: PhotoUploadResponse) => {
        setComparisonPhoto({ before, after });
    };

    return (
        <Container maxWidth="lg">
            <Box sx={{ my: 4 }}>
                <Typography variant="h4" gutterBottom>
                    Job Photos
                </Typography>

                <Paper sx={{ mb: 4 }}>
                    <Tabs
                        value={activeTab}
                        onChange={(_, newValue) => setActiveTab(newValue)}
                        indicatorColor="primary"
                        textColor="primary"
                    >
                        <Tab label="Before Photos" />
                        <Tab label="After Photos" />
                        <Tab label="Comparisons" />
                    </Tabs>
                </Paper>

                <TabPanel value={activeTab} index={0}>
                    <PhotoUpload
                        onUpload={(files) => handleUpload(files, 'before')}
                        multiple
                        type="before"
                        isLoading={uploadMutation.isLoading}
                    />
                    {photos?.before && (
                        <PhotoGallery
                            photos={photos.before}
                            onDelete={handleDelete}
                            onCompare={handleCompare}
                        />
                    )}
                </TabPanel>

                <TabPanel value={activeTab} index={1}>
                    <PhotoUpload
                        onUpload={(files) => handleUpload(files, 'after')}
                        multiple
                        type="after"
                        isLoading={uploadMutation.isLoading}
                    />
                    {photos?.after && (
                        <PhotoGallery
                            photos={photos.after}
                            onDelete={handleDelete}
                            onCompare={handleCompare}
                        />
                    )}
                </TabPanel>

                <TabPanel value={activeTab} index={2}>
                    {photos?.comparisons.map((comparison, index) => (
                        <Box key={index} sx={{ mb: 3 }}>
                            <PhotoComparison
                                beforePhoto={comparison.before}
                                afterPhoto={comparison.after}
                                onFullscreen={() =>
                                    setComparisonPhoto({
                                        before: comparison.before as PhotoUploadResponse,
                                        after: comparison.after as PhotoUploadResponse,
                                    })
                                }
                            />
                        </Box>
                    ))}
                </TabPanel>
            </Box>

            {/* Fullscreen comparison dialog */}
            <Dialog
                open={!!comparisonPhoto}
                onClose={() => setComparisonPhoto(null)}
                maxWidth="xl"
                fullWidth
            >
                <DialogContent sx={{ p: 0, position: 'relative' }}>
                    <IconButton
                        onClick={() => setComparisonPhoto(null)}
                        sx={{ position: 'absolute', right: 8, top: 8, zIndex: 1 }}
                    >
                        <CloseIcon />
                    </IconButton>
                    {comparisonPhoto && (
                        <PhotoComparison
                            beforePhoto={comparisonPhoto.before}
                            afterPhoto={comparisonPhoto.after}
                        />
                    )}
                </DialogContent>
            </Dialog>

            {/* Snackbar for notifications */}
            <Snackbar
                open={snackbar.open}
                autoHideDuration={6000}
                onClose={() => setSnackbar({ ...snackbar, open: false })}
            >
                <Alert
                    onClose={() => setSnackbar({ ...snackbar, open: false })}
                    severity={snackbar.severity}
                >
                    {snackbar.message}
                </Alert>
            </Snackbar>
        </Container>
    );
};

export default JobPhotos; 