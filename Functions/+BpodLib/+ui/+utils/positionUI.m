function positionUI(guiFigure, BpodSystem)
% Position UI window on top of the current position of the Bpod Console
% positionUI(guiFigure, BpodSystem)
%
% Useful when working with multiple state machines?
%
% Parameters
% ----------
% guiFigure : Figure
%     Figure (e.g. UIObject.GUIHandles.Figure) to move
% BpodSystem : BpodObject

checkFigure = @(fig) isgraphics(fig,'figure') && isa(fig,'matlab.ui.Figure');
if ~checkFigure(guiFigure)
    if isfield(guiFigure, 'GUIHandles') && isfield(guiFigure.GUIHandles, 'Figure')
        guiFigure = guiFigure.GUIHandles.Figure;
    else
        error('BpodLib:positionUI:')
    end
end


pos = BpodSystem.GUIHandles.MainFig.Position;
topY = pos(2) + pos(4);
rightX = pos(1) + pos(3);

guiPos = guiFigure.Position;
guiHeight = guiPos(4);
guiWidth = guiPos(3);

newPosY = topY - guiHeight;
newPosX = rightX - guiWidth;

guiFigure.Position = [newPosX, newPosY, guiWidth, guiHeight];

end