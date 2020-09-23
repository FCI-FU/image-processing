
function varargout = test(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


function test_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);
handles.currentImage = imread('wh.png');
guidata(hObject,handles);
setImage2D(handles);

function varargout = test_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        surf(peaks);
end

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)

file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)

printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)

selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)

function x = setImage2D(handles)
    subplot(1,1,1);
    imshow(handles.currentImage);
    
% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
    [filepath]=uigetfile({'*.*'},'Select and image');
    if(strlength(num2str(filepath)) > 1)
        z = imread(filepath);
        handles.currentImage = z;
        guidata(hObject,handles);
        setImage2D(handles);
    end

% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function removeImage_Callback(hObject, eventdata, handles)
    handles.currentImage = imread('wh.png');
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function nieborhoodOperations_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function frequancyDomainFillter_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function smoothingMean_Callback(hObject, eventdata, handles)
    handles.currentImage = MeanFilter(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function smoothingWeighted_Callback(hObject, eventdata, handles)
    handles.currentImage = WeightedFilter(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function smoothingMedian_Callback(hObject, eventdata, handles)
    handles.currentImage = MedianFilter(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function smoothingMaximum_Callback(hObject, eventdata, handles)
    handles.currentImage = MaxFilter(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function smoothingMinimum_Callback(hObject, eventdata, handles)
    handles.currentImage = MinFilter(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function edgeDetection_Callback(hObject, eventdata, handles)
    handles.currentImage = edge_detection(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);
% --------------------------------------------------------------------
function sharpening_Callback(hObject, eventdata, handles)
    handles.currentImage = Sharpening(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);
% --------------------------------------------------------------------
function unSharpeMasking_Callback(hObject, eventdata, handles)
    [filepath]=uigetfile({'*.*'},'Select and image');
    if(strlength(num2str(filepath)) > 1)
        z = imread(filepath);
        handles.currentImage = Unsharp(handles.currentImage,z);
        guidata(hObject,handles);
        setImage2D(handles);
    end

% --------------------------------------------------------------------
function convertToGray_Callback(hObject, eventdata, handles)
    handles.currentImage = Grayscale(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function contrats_Callback(hObject, eventdata, handles)
    prompt = {'Enter the Max','Enter the Min'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    var2 = str2num(answer{2});
    handles.currentImage = Contrast(handles.currentImage,var1,var2);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function brightness_Callback(hObject, eventdata, handles)
    prompt = {'Enter the offset'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = Brightness(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function darkness_Callback(hObject, eventdata, handles)
    prompt = {'Enter the offset'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = Brightness(handles.currentImage,-var1);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function powerLaw_Callback(hObject, eventdata, handles)
    prompt = {'Enter the gamma'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = powered(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function histogramEqualization_Callback(hObject, eventdata, handles)
    handles.currentImage = Histogram_equalization(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);
    
% --------------------------------------------------------------------
function histogramMatching_Callback(hObject, eventdata, handles)
    [filepath]=uigetfile({'*.*'},'Select and image');
    if(strlength(num2str(filepath)) > 1)
        z = imread(filepath);
        handles.currentImage = Histogram_matching(handles.currentImage,z);
        setImage2D(handles);
    end

% --------------------------------------------------------------------
function substractImages_Callback(hObject, eventdata, handles)
    [filepath]=uigetfile({'*.*'},'Select and image');
    if(strlength(num2str(filepath)) > 1)
        z = imread(filepath);
        handles.currentImage = sub_images(handles.currentImage,z);
        setImage2D(handles);
    end

% --------------------------------------------------------------------
function addImages_Callback(hObject, eventdata, handles)
    [filepath]=uigetfile({'*.*'},'Select and image');
    if(strlength(num2str(filepath)) > 1)
        z = imread(filepath);
        handles.currentImage = add_images(handles.currentImage,z);
        setImage2D(handles);
    end

% --------------------------------------------------------------------
function imageNegative_Callback(hObject, eventdata, handles)
    handles.currentImage = negative(handles.currentImage);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function quantization_Callback(hObject, eventdata, handles)
    prompt = {'Enter num of bits'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = Quantization(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function directMap_Callback(hObject, eventdata, handles)
% hObject    handle to directMap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function reverseMap_Callback(hObject, eventdata, handles)
% hObject    handle to reverseMap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RzeroOrder_Callback(hObject, eventdata, handles)
    prompt = {'Enter the Xfactor','Enter the Yfactor'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    var2 = str2num(answer{2});
    handles.currentImage = Reverse_Mapping(handles.currentImage,var1,var2);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function RoneOrder_Callback(hObject, eventdata, handles)
    prompt = {'Enter the Xfactor','Enter the Yfactor'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    var2 = str2num(answer{2});
    handles.currentImage = Reverse_Mapping1(handles.currentImage,var1,var2);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function highFilter_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function lowFilter_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Lideal_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = ideal_low(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function LbutterWorth_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0','Enter order n'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    var2 = str2num(answer{2});
    handles.currentImage = Butterworth_low(handles.currentImage,var1,var2);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function Lgaussian_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = Gaussian_low(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function Hideal_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = ideal_high(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function Hbutterworth_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0','Enter order n'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    var2 = str2num(answer{2});    
    handles.currentImage = Butterworth_high(handles.currentImage,var1,var2);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function Hgaussian_Callback(hObject, eventdata, handles)
    prompt = {'Enter D0'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var1 = str2num(answer{1});
    handles.currentImage = Gaussian_high(handles.currentImage,var1);
    guidata(hObject,handles);
    setImage2D(handles);

% --------------------------------------------------------------------
function showHistogram_Callback(hObject, eventdata, handles)
    Histogram(handles.currentImage);


% --------------------------------------------------------------------
function DzeroOrder_Callback(hObject, eventdata, handles)
    prompt = {'Enter the factor'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var = str2num(answer{1});
    handles.currentImage = DirectMap_0order(handles.currentImage,var);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function DoneOrder_Callback(hObject, eventdata, handles)
    prompt = {'Enter the factor'};
    dlgtitle = 'Input';
    dims = [1 35];
    answer = inputdlg(prompt,dlgtitle,dims);
    var = str2num(answer{1});
    handles.currentImage = DirectMap_1order(handles.currentImage,var);
    guidata(hObject,handles);
    setImage2D(handles);


% --------------------------------------------------------------------
function uitoggletool3_ClickedCallback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
     new_Callback(hObject, eventdata, handles)
