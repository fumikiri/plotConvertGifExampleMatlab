

% 設定パラメータ%%%%%%%%%%%%%%%%

hight = 400; % プロットするfigureの縦幅
width = 800; % プロットするfigureの横幅

sizen= 512; % rgb2ind()の関数でRGBイメージをインデックス付きイメージに変換する…らしい(よくわからん)。
            % ただ、gifにアニメーションとして保存するサイズに対してこのsizeが小さいと"権限がない"
            % とかのエラーがでる。そうなったらこのsizeを大きくしてみよう。

delaytime = 0.5; % 画像を送る（更新する）間隔。単位は秒。つまり今回は0.5秒で切り替わる            


% プロット＆保存 %%%%%%%%%%%%%%%

h = figure('Position',[100 100 width hight]);
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif'; % 保存する名前
for n = 1:0.5:10
    % Draw plot for y = x.^n
    x = 0:0.01:1;
    y = x.^n;
    plot(x,y) 
    drawnow % figureを更新する
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