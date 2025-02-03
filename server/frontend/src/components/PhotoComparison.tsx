import React, { useState } from 'react';
import {
    Box,
    Card,
    CardContent,
    Typography,
    Slider,
    IconButton,
    Stack,
    Tooltip,
} from '@mui/material';
import CompareArrowsIcon from '@mui/icons-material/CompareArrows';
import FullscreenIcon from '@mui/icons-material/Fullscreen';
import { styled } from '@mui/material/styles';

interface Photo {
    url: string;
    variants: {
        square?: string;
    };
    type: 'before' | 'after';
    metadata?: {
        location?: string;
    };
}

interface PhotoComparisonProps {
    beforePhoto: Photo;
    afterPhoto: Photo;
    onFullscreen?: () => void;
}

const ComparisonContainer = styled(Box)(({ theme }) => ({
    position: 'relative',
    width: '100%',
    height: '400px',
    overflow: 'hidden',
    borderRadius: theme.shape.borderRadius,
}));

const ComparisonImage = styled('img')({
    position: 'absolute',
    top: 0,
    left: 0,
    width: '100%',
    height: '100%',
    objectFit: 'cover',
});

const Divider = styled(Box)(({ theme }) => ({
    position: 'absolute',
    top: 0,
    bottom: 0,
    width: '4px',
    backgroundColor: theme.palette.primary.main,
    cursor: 'ew-resize',
}));

const PhotoComparison: React.FC<PhotoComparisonProps> = ({
    beforePhoto,
    afterPhoto,
    onFullscreen,
}) => {
    const [position, setPosition] = useState(50);
    const [isDragging, setIsDragging] = useState(false);

    const handleMouseDown = () => {
        setIsDragging(true);
    };

    const handleMouseUp = () => {
        setIsDragging(false);
    };

    const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
        if (!isDragging) return;

        const rect = e.currentTarget.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const newPosition = (x / rect.width) * 100;
        setPosition(Math.max(0, Math.min(100, newPosition)));
    };

    const handleSliderChange = (event: Event, newValue: number | number[]) => {
        setPosition(newValue as number);
    };

    return (
        <Card>
            <ComparisonContainer
                onMouseMove={handleMouseMove}
                onMouseUp={handleMouseUp}
                onMouseLeave={handleMouseUp}
            >
                <ComparisonImage
                    src={beforePhoto.variants.square || beforePhoto.url}
                    alt="Before"
                    style={{ clipPath: `inset(0 ${100 - position}% 0 0)` }}
                />
                <ComparisonImage
                    src={afterPhoto.variants.square || afterPhoto.url}
                    alt="After"
                />
                <Divider
                    onMouseDown={handleMouseDown}
                    sx={{ left: `${position}%`, transform: 'translateX(-50%)' }}
                />
            </ComparisonContainer>
            <CardContent>
                <Stack spacing={2}>
                    <Stack direction="row" justifyContent="space-between" alignItems="center">
                        <Typography variant="subtitle1">
                            {beforePhoto.metadata?.location || 'Before/After Comparison'}
                        </Typography>
                        <Stack direction="row" spacing={1}>
                            <Tooltip title="Reset Comparison">
                                <IconButton
                                    size="small"
                                    onClick={() => setPosition(50)}
                                >
                                    <CompareArrowsIcon />
                                </IconButton>
                            </Tooltip>
                            {onFullscreen && (
                                <Tooltip title="Fullscreen">
                                    <IconButton
                                        size="small"
                                        onClick={onFullscreen}
                                    >
                                        <FullscreenIcon />
                                    </IconButton>
                                </Tooltip>
                            )}
                        </Stack>
                    </Stack>
                    <Slider
                        value={position}
                        onChange={handleSliderChange}
                        aria-label="Comparison slider"
                        sx={{ width: '100%' }}
                    />
                    <Stack direction="row" justifyContent="space-between">
                        <Typography variant="caption" color="textSecondary">
                            Before
                        </Typography>
                        <Typography variant="caption" color="textSecondary">
                            After
                        </Typography>
                    </Stack>
                </Stack>
            </CardContent>
        </Card>
    );
};

export default PhotoComparison; 