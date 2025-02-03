import axios from 'axios';

const API_URL = 'http://localhost:5001/api';

export interface PhotoUploadResponse {
    url: string;
    public_id: string;
    type: string;
    uploadedAt: string;
    variants: {
        thumbnail?: string;
        medium?: string;
        large?: string;
        square?: string;
    };
    metadata: {
        size: number;
        format: string;
        width: number;
        height: number;
        colors?: string[];
        predominant?: string[];
    };
}

export interface PhotosResponse {
    before: PhotoUploadResponse[];
    after: PhotoUploadResponse[];
    comparisons: {
        before: {
            url: string;
            thumbnail?: string;
            square?: string;
        };
        after: {
            url: string;
            thumbnail?: string;
            square?: string;
        };
        metadata: {
            taskId?: string;
            location?: string;
            beforeTime: string;
            afterTime: string;
        };
    }[];
}

const photoService = {
    // Upload single or multiple photos
    uploadJobPhotos: async (jobId: string, files: File[], type: 'before' | 'after'): Promise<PhotoUploadResponse[]> => {
        const formData = new FormData();
        const isBatch = files.length > 1;

        files.forEach(file => {
            formData.append(isBatch ? 'photos' : 'photo', file);
        });

        const response = await axios.post(
            `${API_URL}/photos/jobs/${jobId}?type=${type}${isBatch ? '&batch=true' : ''}`,
            formData,
            {
                headers: {
                    'Content-Type': 'multipart/form-data',
                    Authorization: `Bearer ${localStorage.getItem('token')}`,
                },
            }
        );

        return response.data;
    },

    // Upload profile photo
    uploadProfilePhoto: async (file: File): Promise<PhotoUploadResponse> => {
        const formData = new FormData();
        formData.append('photo', file);

        const response = await axios.post(
            `${API_URL}/photos/profile`,
            formData,
            {
                headers: {
                    'Content-Type': 'multipart/form-data',
                    Authorization: `Bearer ${localStorage.getItem('token')}`,
                },
            }
        );

        return response.data;
    },

    // Get job photos with optional comparison
    getJobPhotos: async (jobId: string, compare = false): Promise<PhotosResponse> => {
        const response = await axios.get(
            `${API_URL}/photos/jobs/${jobId}${compare ? '?compare=true' : ''}`,
            {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem('token')}`,
                },
            }
        );

        return response.data;
    },

    // Delete single photo
    deletePhoto: async (jobId: string, photoId: string): Promise<void> => {
        await axios.delete(
            `${API_URL}/photos/jobs/${jobId}/${photoId}`,
            {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem('token')}`,
                },
            }
        );
    },

    // Delete multiple photos
    deletePhotos: async (jobId: string, photoIds: string[]): Promise<void> => {
        await axios.delete(
            `${API_URL}/photos/jobs/${jobId}?photoIds=${photoIds.join(',')}`,
            {
                headers: {
                    Authorization: `Bearer ${localStorage.getItem('token')}`,
                },
            }
        );
    },
};

export default photoService; 