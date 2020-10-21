% Creates visualizations for the canonical pairs

% Load variables
task='Rest'; % set task here to match the input
colorlims=[-1*10^-4 1*10^-4]; % to keep heatmaps consistent
colorlims_nws=[-1*10^-6 1*10^-6];

weights=csvread(strcat('/Users/ltozzi/Desktop/Elena_Results/Connectome-master/Results/Connectome/', task, '/GRCCA/Adjust gender/alpha_adj_gender.csv'), 1, 1);
groups=[13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 1, 2, 2, 2, 2, 2, 2, 3, 3, 4, 5, 6, 2, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 8, 6, 6, 10, 6, 7, 9, 9, 9, 9, 9, 9, 3, 4, 4, 3, 3, 3, 3, 4, 4, 4, 5, 3, 2, 2, 5, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 9, 9, 7, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 6, 6, 9, 7, 4, 6, 7, 6, 7, 7, 4, 7, 4, 9, 9, 7, 9, 7, 7, 9, 9, 5, 5, 7, 7, 4, 3, 3, 3, 8, 8, 4, 4, 8, 4, 4, 12, 7, 12, 4, 4, 3, 5, 5, 9, 9, 9, 1, 11, 6, 8, 6, 9, 5, 6, 6, 9, 9, 9, 7, 9, 11, 5, 5, 2, 6, 10, 10, 1, 5, 7, 7, 5, 4, 4, 7, 9, 9, 2, 2, 2, 9, 2, 2, 2, 2, 2, 9, 9, 2, 9, 9, 12, 4, 3, 4, 7, 7, 6, 8, 8, 8, 9, 9, 4, 4, 4, 1, 2, 2, 2, 2, 2, 2, 3, 3, 4, 4, 6, 2, 7, 7, 2, 2, 2, 2, 2, 2, 2, 2, 8, 4, 6, 10, 10, 7, 9, 9, 9, 9, 9, 9, 3, 4, 4, 3, 3, 3, 3, 4, 4, 4, 5, 3, 2, 2, 5, 3, 3, 3, 3, 3, 3, 4, 7, 4, 4, 9, 7, 7, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 7, 6, 9, 7, 4, 6, 7, 7, 4, 7, 4, 7, 4, 9, 9, 7, 9, 7, 7, 7, 9, 5, 5, 7, 7, 4, 3, 3, 3, 8, 3, 4, 4, 8, 4, 4, 12, 7, 12, 4, 4, 3, 5, 5, 9, 9, 9, 1, 11, 6, 8, 6, 9, 5, 9, 6, 9, 9, 9, 7, 9, 11, 5, 5, 2, 6, 10, 10, 1, 5, 7, 7, 5, 4, 4, 7, 9, 9, 2, 2, 2, 9, 2, 2, 2, 2, 2, 9, 7, 2, 9, 9, 12, 4, 3, 4, 7, 7, 6, 8, 8, 8, 9, 7, 4, 4, 4];
groupnames={'VIS1', 'VIS2', 'SMM', 'COP', 'DAN', 'LAN', 'FPN', 'AUD', 'DMN', 'PMM', 'VMM', 'OAN', 'SC', 'CER'};
quest=csvread(strcat('/Users/ltozzi/Desktop/Elena_Results/Connectome-master/Results/Connectome/', task, '/GRCCA/Adjust gender/beta_adj_gender.csv'),1,1);
q_names={'Anger-affect' 'Anger-hostility' 'Anger-aggression' 'Fear-affect' 'Fear-somatic' 'Sadness' 'Life satisfaction' 'Meaning-purpose' 'Positive affect' 'Friendship' 'Loneliness' 'Perceived hostility' 'Perceived rejection' 'Emotional support' 'Instrumental support' 'Percieved stress' 'Self efficacy'};
outputdir='/Users/ltozzi/Desktop/Oak/ltozzi/hcpdes/elena_study/Figures/';
proxycif='/Users/ltozzi/Desktop/glasser_vis/strength_1.pscalar.nii';
test_questscores=csvread(strcat('/Users/ltozzi/Desktop/Elena_Results/Connectome-master/Results/Connectome/', task, '/GRCCA/Adjust gender/questionnaire_scores_adj_gender_test.csv'), 1, 1);
test_brainscores=csvread(strcat('/Users/ltozzi/Desktop/Elena_Results/Connectome-master/Results/Connectome/', task, '/GRCCA/Adjust gender/brain_scores_adj_gender_test.csv'), 1, 1);
J = customcolormap_preset('red-white-blue');


for cc=1:size(weights, 2)
    
    % Get weights
    compweights=(weights(:, cc));
    mat=repackconnmat(compweights, 379);
    
    % Save full matrix of all weights
    heatmap(mat(groups,groups), 'Colormap', J, 'GridVisible', 'off', 'ColorLimits',colorlims)
    Ax = gca;
    Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
    Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
        set(gca,'FontSize',15)
    saveas(gcf,strcat(outputdir, task, '_comp', num2str(cc), '_allregions.png'))
    close
    
    csvwrite(strcat(outputdir, task, '_comp', num2str(cc), '_allregions.csv'), mat)
    
    % Create network matrix
    for section_row=1:max(groups)
        k_row=find(groups==section_row);
        for section_col=1:max(groups)
            k_col=find(groups==section_col);
            
            % If section to itself, calculate average
            % connectivity within network only in the upper triangle
            if section_row==section_col
                temp=mat(k_row, k_col);
                trionly=unpackconnmat(temp);
                newmat(section_row, section_col)=mean(trionly);
            else
                newmat(section_row, section_col)=mean(mean(mat(k_row, k_col)));
            end
        end
    end
    
    % Save network matrix
    figure
    heatmap(groupnames, groupnames, newmat, 'Colormap', J, 'GridVisible', 'off', 'ColorLimits',colorlims_nws)
    set(gca,'FontSize',15)
    saveas(gcf,strcat(outputdir, task, '_comp', num2str(cc), '_nws.png'))
    close
    
    csvwrite(strcat(outputdir, task, '_comp', num2str(cc), '_nws.csv'), mat)
    
    % Save bar graph of questionnaire weights
    figure('Position', [10 10 600 600])
    bar(quest(:,cc), 'LineWidth', 2, 'FaceColor', [0.5 0.5 0.5])
    ylim([-0.15 0.2])
    xticklabels(q_names)
    xtickangle(45)
    set(gca,'FontSize',30)
    saveas(gcf,strcat(outputdir, task, '_comp', num2str(cc), '_ques.png'))
    close
    
    %%%%% Plot strength for each region
    
    % loading proxy CIFTI
    cif=ciftiopen(proxycif,'/Applications/workbench/bin_macosx64/wb_command');
    
    [Spos1 Sneg1]=strengths_und_sign(mat);
    
    cif.cdata=Spos1';
    ciftisave(cif, strcat(outputdir, task, '_comp', num2str(cc), '_strength1_pos.pscalar.nii'), '/Applications/workbench/bin_macosx64/wb_command')
    cif.cdata=Sneg1';
    ciftisave(cif, strcat(outputdir, task, '_comp', num2str(cc), '_strength1_neg.pscalar.nii'), '/Applications/workbench/bin_macosx64/wb_command')
    
    csvwrite(strcat(outputdir, task, '_comp', num2str(cc), '_strength.csv'), [Spos1' Sneg1'])
    
    
    %%%%% Put node strength on brain macro-regions
    
    % loading proxy CIFTI
    cif=ciftiopen(proxycif,'/Applications/workbench/bin_macosx64/wb_command');
    
    [Sposmr1 Snegmr1]=strengths_und_sign(newmat);
    
    cif.cdata=nan(size(cif.cdata));
    for section=1:max(groups)
        cif.cdata(groups==section)=Sposmr1(1, section);
    end
    ciftisave(cif, strcat(outputdir, task, '_comp', num2str(cc), '_strength1_pos_nws.pscalar.nii'), '/Applications/workbench/bin_macosx64/wb_command')
    
    cif.cdata=nan(size(cif.cdata));
    for section=1:max(groups)
        cif.cdata(groups==section)=Snegmr1(1, section);
    end
   ciftisave(cif, strcat(outputdir, task, '_comp', num2str(cc), '_strength1_neg_nws.pscalar.nii'), '/Applications/workbench/bin_macosx64/wb_command')
    
    csvwrite(strcat(outputdir, task, '_comp', num2str(cc), '_nws_strength.csv'), [Sposmr1' Snegmr1'])
    
    % Scatterplots
    figure('Position', [10 10 800 600])
    scatter(test_questscores(:,cc), test_brainscores(:,cc), 20, 'k', 'filled')
    ls=lsline;
    ls.LineStyle='--';
    ls.Color='k';
    ylabel('Brain score')
    xlabel('Questionnaire score')
    title(strcat('r=', num2str(corr(test_questscores(:,cc), test_brainscores(:,cc)), '%.3f')))
    set(gca,'FontSize',30)
    saveas(gcf,strcat(outputdir, task, '_comp', num2str(cc), '_scatter.png'))
    
end