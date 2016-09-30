clear(); 
% Get all PDF files in the current folder
%files = dir('*.png');

dirData = dir('*.png');
fileNames = {dirData.name};
figure;
 
 fidLABEL = fopen('C:/slimerjs/train/sorted/list/labels.txt','a+');
 fidTRAIN = fopen('C:/slimerjs/train/sorted/list/train.txt','a+');
 
 %fidVAL = fopen('C:/slimerjs/train/sorted/list/val.txt',writeaccess);
 %fidVALID = fopen('C:/slimerjs/train/sorted/list/val_id.txt',writeaccess);
 
 %fidTEST = fopen('C:/slimerjs/train/sorted/list/test.txt',writeaccess);
 %fidTESTAUG = fopen('C:/slimerjs/train/sorted/list/test_aug.txt',writeaccess);
 
for iFile = 1:numel(fileNames)
  fileNum = str2num(regexprep(fileNames{iFile}, '[^0-9]', ''));
  BW = imread(fileNames{iFile});
  TL = imcrop(BW,[0 0 800 450]); % TL = top left "viewport"
  TR = imcrop(BW,[801 0 1600 450]); % TR = top right "viewport"
  BL = imcrop(BW,[0 453 800 906]); % TL = bottom left "viewport"
  BR = imcrop(BW,[801 453 1600 906]); % TR = bottom right "viewport"
  
  BinaryTop = CheckValidationGate(TL);
  BinaryBottom = CheckValidationGate(BL);
  
  %BinaryTop = CheckBuoy1(TL);
  %BinaryBottom = CheckBuoy1(BL);
  %BinaryTop = CheckBuoy2(TL);
  %BinaryBottom = CheckBuoy2(BL);
  %BinaryTop = CheckBuoy3(TL);
  %BinaryBottom = CheckBuoy3(BL);
  %BinaryTop = CheckManeuverYellow(TL);
  %BinaryBottom = CheckManeuverYellow(BL);
  %BinaryTop = CheckManeuverRed(TL);
  %BinaryBottom = CheckManeuverRed(BL);
  %BinaryTop = CheckOrangeBin(TL);
  %BinaryBottom = CheckOrangeBin(BL);
  
  %BinaryTop = CheckPurpleBin(TL);
  %BinaryTop2 = CheckManeuverRed(TL);
  %BinaryBottom = CheckPurpleBin(BL);
  %BinaryBottom2 = CheckManeuverRed(BL);
  
  %BinaryTop = CheckWhiteBin(TL);
  %BinaryBottom = CheckWhiteBin(BL);
  
  %BinaryTop = CheckYellowBin(TL);
  %BinaryBottom = CheckYellowBin(BL);
  
  %BinaryTop = CheckDigitsTorpedo(TL);
  %BinaryBottom = CheckDigitsTorpedo(BL);
  
  %BinaryTop = CheckOrangeTorpedo(TL);
  %BinaryBottom = CheckOrangeTorpedo(BL);
  
  %BinaryTop = CheckPurpleTorpedo(TL);
  %BinaryBottom = CheckPurpleTorpedo(BL);
  
  %BinaryTop = CheckPathMarker(TL);
  %BinaryBottom = CheckPathMarker(BL);
  
  %BinaryTop = CheckYellowTorpedo(TL);
  %BinaryBottom = CheckYellowTorpedo(BL);
  
  %BinaryTop = CheckDelorean(TL);
  %BinaryBottom = CheckDelorean(BL);
  %BinaryTop2 = CheckYellowTorpedo(TL);
  %BinaryBottom2 = CheckYellowTorpedo(BL);
  
  %BinaryTop = CheckTrain(TL);
  %BinaryBottom = CheckTrain(BL);
  
  %BinaryTop = CheckObjectStands(TL);
  %BinaryBottom = CheckObjectStands(BL);
  
  %BinaryTop = CheckRRTrack(TL);
  %BinaryBottom = CheckRRTrack(BL);
  
  %BinaryTop = CheckOctagons(TL);
  %BinaryBottom = CheckOctagons(BL);

  %if((bwarea(BinaryTop) > 25) == true && (bwarea(BinaryTop2) > 25) == false)
  if((bwarea(BinaryTop) > 25) == true)
      %split the image in to its two "viewports"
     tmpfilename = sprintf('%04d.jpg', fileNum);
     tmpfilename2 = sprintf('%04d.png', fileNum);
     tmpfilepath = 'C:/slimerjs/train/sorted/dongs/bottom/JPEGImages/';
     tmpfilepath2 = 'C:/slimerjs/train/sorted/dongs/top/SegmentationClassAug';
     
     imwrite(TR, tmpfilename,'jpg','Quality',100);
     imwrite(TL, tmpfilename2,'png');
     %go to the end of the file "fid"
     fseek(fidTRAIN, 0, 'eof');
     %insert a line of text
     fwrite(fidTRAIN,sprintf('/JPEGImages/2007_%04d.jpg /SegmentationClassAug/2007_%04d.png\n',fileNum),'char');
     fseek(fidLABEL, 0, 'eof');
     fwrite(fidLABEL,sprintf('%04d.jpg 1\n',fileNum),'char');
  end
  if((bwarea(BinaryBottom) > 25) == true)
  %if((bwarea(BinaryBottom) > 25) == true && (bwarea(BinaryBottom2) > 25) == false)
     %split the image in to its two "viewports"
     tmpfilepath = 'C:/slimerjs/train/sorted/dongs/bottom/JPEGImages/';
     tmpfilepath2 = 'C:/slimerjs/train/sorted/dongs/top/SegmentationClassAug';
     tmpfilename = sprintf('bottom%04d.jpg', fileNum);
     tmpfilename2 = sprintf('bottom%04d.png', fileNum);
     
     imwrite(BR, tmpfilename,'jpg','Quality',100);
     imwrite(BL, tmpfilename2,'png');
     %go to the end of the file "fid"
     fseek(fidTRAIN, 0, 'eof');
     %insert a line of text
     fwrite(fidTRAIN,sprintf('/JPEGImages/2007_%04d.jpg /SegmentationClassAug/2007_%04d.png\n',fileNum),'char');
     fseek(fidLABEL, 0, 'eof');
     fwrite(fidLABEL,sprintf('%04d.jpg 1\n',fileNum),'char');
  end
  
end

fclose(fidLABEL);
fclose(fidTRAIN);
 