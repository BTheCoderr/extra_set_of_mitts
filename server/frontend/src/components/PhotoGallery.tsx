import React, { useState } from 'react';
import {
    Box,
    Grid,
    Card,
    CardMedia,
    CardContent,
    Typography,
    IconButton,
    Dialog,
    DialogContent,
    Chip,
    Stack,
    Tooltip,
} from '@mui/material';
import DeleteIcon from '@mui/icons-material/Delete';
import CompareIcon from '@mui/icons-material/Compare';
import AccessTimeIcon from '@mui/icons-material/AccessTime';
import PhotoIcon from '@mui/icons-material/Photo';

interface Photo {
    url: string;
    public_id: string;
    type: 'before' | 'after';
    uploadedAt: string;
    variants: {
        thumbnail?: string;
        medium?: string;
        large?: string;
        square?: string;
    };
    metadata?: {
        taskId?: string;
        location?: string;
        size?: number;
        format?: string;
    };
}

interface PhotoGalleryProps {
    photos: Photo[];
    onDelete: (photoId: string) => Promise<void>;
    onCompare?: (beforePhoto: Photo, afterPhoto: Photo) => void;
    showComparison?: boolean;
}

const PhotoGallery: React.FC<PhotoGalleryProps> = ({
    photos,
    onDelete,
    onCompare,
    showComparison = true,
}) => {
    const [selectedPhoto, setSelectedPhoto] = useState<Photo | null>(null);
    const [isDialogOpen, setIsDialogOpen] = useState(false);

    const handlePhotoClick = (photo: Photo) => {
        setSelectedPhoto(photo);
        setIsDialogOpen(true);
    };

    const handleCompare = (photo: Photo) => {
        const otherType = photo.type === 'before' ? 'after' : 'before';
        const matchingPhoto = photos.find(
            p => p.type === otherType && 
                p.metadata?.taskId === photo.metadata?.taskId &&
                p.metadata?.location === photo.metadata?.location
        );

        if (matchingPhoto && onCompare) {
            onCompare(
                photo.type === 'before' ? photo : matchingPhoto,
                photo.type === 'after' ? photo : matchingPhoto
            );
        }
    };

    const formatDate = (dateString: string) => {
        return new Date(dateString).toLocaleString();
    };

    return (
        <>
            <Grid container spacing={2}>
                {photos.map((photo) => (
                    <Grid item xs={12} sm={6} md={4} key={photo.public_id}>
                        <Card>
                            <CardMedia
                                component="img"
                                height="200"
                                image={photo.variants.medium || photo.url}
                                alt={`${photo.type} photo`}
                                onClick={() => handlePhotoClick(photo)}
                                sx={{ cursor: 'pointer', objectFit: 'cover' }}
                            />
                            <CardContent>
                                <Stack direction="row" spacing={1} alignItems="center" mb={1}>
                                    <Chip
                                        label={photo.type}
                                        color={photo.type === 'before' ? 'primary' : 'secondary'}
                                        size="small"
                                    />
                                    {photo.metadata?.location && (
                                        <Chip
                                            label={photo.metadata.location}
                                            variant="outlined"
                                            size="small"
                                        />
                                    )}
                                </Stack>
                                <Stack direction="row" spacing={1} alignItems="center">
                                    <Tooltip title="Delete">
                                        <IconButton
                                            size="small"
                                            onClick={() => onDelete(photo.public_id)}
                                        >
                                            <DeleteIcon />
                                        </IconButton>
                                    </Tooltip>
                                    {showComparison && (
                                        <Tooltip title="Compare">
                                            <IconButton
                                                size="small"
                                                onClick={() => handleCompare(photo)}
                                            >
                                                <CompareIcon />
                                            </IconButton>
                                        </Tooltip>
                                    )}
                                    <Box sx={{ flexGrow: 1 }} />
                                    <Tooltip title={formatDate(photo.uploadedAt)}>
                                        <AccessTimeIcon fontSize="small" color="action" />
                                    </Tooltip>
                                </Stack>
                            </CardContent>
                        </Card>
                    </Grid>
                ))}
            </Grid>

            <Dialog
                open={isDialogOpen}
                onClose={() => setIsDialogOpen(false)}
                maxWidth="lg"
                fullWidth
            >
                <DialogContent>
                    {selectedPhoto && (
                        <Box>
                            <img
                                src={selectedPhoto.variants.large || selectedPhoto.url}
                                alt={`${selectedPhoto.type} photo`}
                                style={{ width: '100%', height: 'auto' }}
                            />
                            <Box sx={{ mt: 2 }}>
                                <Typography variant="subtitle1" gutterBottom>
                                    Photo Details
                                </Typography>
                                <Grid container spacing={2}>
                                    <Grid item xs={6}>
                                        <Typography variant="body2" color="textSecondary">
                                            Type: {selectedPhoto.type}
                                        </Typography>
                                        <Typography variant="body2" color="textSecondary">
                                            Uploaded: {formatDate(selectedPhoto.uploadedAt)}
                                        </Typography>
                                    </Grid>
                                    <Grid item xs={6}>
                                        <Typography variant="body2" color="textSecondary">
                                            Format: {selectedPhoto.metadata?.format}
                                        </Typography>
                                        <Typography variant="body2" color="textSecondary">
                                            Size: {((selectedPhoto.metadata?.size || 0) / (1024 * 1024)).toFixed(2)} MB
                                        </Typography>
                                    </Grid>
                                </Grid>
                            </Box>
                        </Box>
                    )}
                </DialogContent>
            </Dialog>
        </>
    );
};

export default PhotoGallery; 