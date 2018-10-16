

% �ݒ�p�����[�^%%%%%%%%%%%%%%%%

hight = 400; % �v���b�g����figure�̏c��
width = 800; % �v���b�g����figure�̉���

sizen= 512; % rgb2ind()�̊֐���RGB�C���[�W���C���f�b�N�X�t���C���[�W�ɕϊ�����c�炵��(�悭�킩���)�B
            % �����Agif�ɃA�j���[�V�����Ƃ��ĕۑ�����T�C�Y�ɑ΂��Ă���size����������"�������Ȃ�"
            % �Ƃ��̃G���[���ł�B�����Ȃ����炱��size��傫�����Ă݂悤�B

delaytime = 0.5; % �摜�𑗂�i�X�V����j�Ԋu�B�P�ʂ͕b�B�܂荡���0.5�b�Ő؂�ւ��            


% �v���b�g���ۑ� %%%%%%%%%%%%%%%

h = figure('Position',[100 100 width hight]);
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif'; % �ۑ����閼�O
for n = 1:0.5:10
    % Draw plot for y = x.^n
    x = 0:0.01:1;
    y = x.^n;
    plot(x,y) 
    drawnow % figure���X�V����
    % Capture the plot as an image
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,sizen);
    % Write to the GIF File
    if n == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',delaytime);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',delaytime);
    end
end