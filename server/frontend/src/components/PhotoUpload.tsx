import React, { useCallback } from 'react';
import { useDropzone } from 'react-dropzone';
import { Box, Typography, CircularProgress, Button, Stack } from '@mui/material';
import CloudUploadIcon from '@mui/icons-material/CloudUpload';
import { styled } from '@mui/material/styles';

const DropzoneArea = styled(Box)(({ theme }) => ({
    border: `2px dashed ${theme.palette.primary.main}`,
    borderRadius: theme.shape.borderRadius,
    padding: theme.spacing(4),
    textAlign: 'center',
    cursor: 'pointer',
    backgroundColor: theme.palette.background.paper,
    '&:hover': {
        backgroundColor: theme.palette.action.hover,
    },
}));

interface PhotoUploadProps {
    onUpload: (files: File[]) => Promise<void>;
    multiple?: boolean;
    type?: 'before' | 'after';
    isLoading?: boolean;
    accept?: string[];
    maxFiles?: number;
}

const PhotoUpload: React.FC<PhotoUploadProps> = ({
    onUpload,
    multiple = false,
    type = 'before',
    isLoading = false,
    accept = ['image/jpeg', 'image/png', 'image/heic'],
    maxFiles = 10,
}) => {
    const onDrop = useCallback(async (acceptedFiles: File[]) => {
        try {
            await onUpload(acceptedFiles);
        } catch (error) {
            console.error('Upload error:', error);
        }
    }, [onUpload]);

    const { getRootProps, getInputProps, isDragActive, acceptedFiles } = useDropzone({
        onDrop,
        accept: accept.reduce((acc, curr) => ({ ...acc, [curr]: [] }), {}),
        multiple,
        maxFiles,
    });

    return (
        <Box sx={{ width: '100%', my: 2 }}>
            <DropzoneArea {...getRootProps()}>
                <input {...getInputProps()} />
                <Stack spacing={2} alignItems="center">
                    <CloudUploadIcon color="primary" sx={{ fontSize: 48 }} />
                    {isLoading ? (
                        <CircularProgress />
                    ) : isDragActive ? (
                        <Typography>Drop the files here...</Typography>
                    ) : (
                        <>
                            <Typography variant="h6">
                                {multiple ? 'Upload Photos' : 'Upload Photo'}
                            </Typography>
                            <Typography variant="body2" color="textSecondary">
                                Drag & drop {type} photos here, or click to select
                            </Typography>
                            <Typography variant="caption" color="textSecondary">
                                Accepted formats: JPG, PNG, HEIC
                            </Typography>
                            {multiple && (
                                <Typography variant="caption" color="textSecondary">
                                    Maximum {maxFiles} files
                                </Typography>
                            )}
                        </>
                    )}
                </Stack>
            </DropzoneArea>

            {acceptedFiles.length > 0 && !isLoading && (
                <Box sx={{ mt: 2 }}>
                    <Typography variant="subtitle2" gutterBottom>
                        Selected Files:
                    </Typography>
                    {acceptedFiles.map((file: File) => (
                        <Typography key={file.name} variant="body2" color="textSecondary">
                            {file.name} - {(file.size / (1024 * 1024)).toFixed(2)} MB
                        </Typography>
                    ))}
                    <Button
                        variant="contained"
                        color="primary"
                        onClick={() => onUpload(acceptedFiles)}
                        sx={{ mt: 2 }}
                    >
                        Upload {acceptedFiles.length} {acceptedFiles.length === 1 ? 'File' : 'Files'}
                    </Button>
                </Box>
            )}
        </Box>
    );
};

export default PhotoUpload; 