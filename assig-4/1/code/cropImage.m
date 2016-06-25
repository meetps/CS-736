function cropped_image = cropImage(imageData,imageMask)

[row,col] = find(imageMask);

topLeftRow = min(row);
topLeftCol = min(col);
bottomRightRow = max(row);
bottomRightCol = max(col);

cropped_image = imageData(topLeftRow:bottomRightRow, topLeftCol:bottomRightCol, :);

end