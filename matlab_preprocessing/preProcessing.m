function dataOUT = preProcessing(y,fs,trig,samples_Shift)

    % y = data signal ( allTrial x channel )
    % fs = sampling frequency
    % trig = trigger vector
    % samples_Shifted = 8 seconds * fs = 2048 samples
    
    N=size(y,1);
    t=0:1/fs:(N-1)/fs;
    epoch=cell(2,1);
    
    % shift by 8 seconds the trig and time vectors
    trig_shifted=circshift(trig,-samples_Shift);       
    j=find(trig_shifted==1 | trig_shifted==-1,1);           %find first trial, 
    y=detrend(y);
    t_clean=t(j-1:end-samples_Shift);
    trig_clean=trig_shifted(j-1:end-samples_Shift);
    
    y=y-mean(y,1);
    for i=1:1:size(y,2)                     % eliminate before start trial and the 
        x(:,i)=y(j-1:end,i);                % last 8 seconds which no trial active
        x_clean(:,i)=x(1:end-samples_Shift,i);
        x_norm(:,i)=x_clean(:,i)/max(x_clean(:,i));
    end
    
    
    
    figure(1)
    plot(t_clean,x_norm(:,1),t_clean,trig_clean) 
    hold on
    plot(t,trig,':')
    legend('signal','trig shift','trig original')
    
    trig=trig_clean;
    x=x_clean;
    t=t_clean;
    clear x_clean t_clean trig_clean
    
    %find the start and the end of each epoch
    idx=find(diff(trig)~=0);
    %FILTERING
    fn=fs/2; Wt1=4/fn; Wp1=5/fn; Wp2=30/fn; Wt2=35/fn;
    [b_LPF,a_LPF] = cheby2(20, 20, Wt2);   
    [n,Wn] = buttord(Wp1, Wt1, 5, 20);
    [b_HPF,a_HPF]=butter(n,Wn,'high');
    for channel=1:1:size(x,2)
        j1=0;
        j2=0;
        for i=1:2:length(idx)
            if i+1 < length(idx) %consider the entire trial
                y=x(idx(i)+1:idx(i+1),channel); %extract single trial                                
                y1=filtfilt(b_LPF,a_LPF,y);
                y2=filtfilt(b_HPF,a_HPF,y1);

                % we are losing information why the transitory phase in the first 20/3
                % samples and the last 20/3 samples (20=order IIR filter)=> no
                % problem!
                if trig(idx(i)+1)==-1
                    classe=1;
                    j1=j1+1;
                    epoch{classe}(:,channel,j1)= y2;
                else
                    classe=2;
                    j2=j2+1;
                    epoch{classe}(:,channel,j2)= y2;
                end
                
            else                                 
                break;  %ignore if trial is no complete
            end
        end
    end
    dataOUT=epoch;
end

