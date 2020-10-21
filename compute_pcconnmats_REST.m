% Save the connectivity matrices with the optimal values of L2

subs={'100307' '100408' '100610' '101006' '101309' '101915' '102008' '102311' '102513' '102816' '103111' '103414' '103515' '103818' '104012' '104416' '104820' '105014' '105115' '105216' '105923' '106319' '106521' '107018' '107321' '107422' '107725' '108121' '108222' '108525' '108828' '109123' '109325' '110411' '111009' '111413' '111514' '112516' '112920' '113215' '113619' '113922' '114217' '114318' '114419' '114621' '114823' '115017' '115219' '115320' '115825' '116524' '117122' '117324' '117930' '118023' '118124' '118225' '118730' '118932' '120111' '120212' '120717' '121416' '121618' '121921' '122317' '122822' '123117' '123420' '123521' '123723' '123925' '124220' '124624' '124826' '125525' '126325' '126628' '127226' '127630' '127731' '127832' '127933' '128127' '128632' '128935' '129028' '129129' '129331' '130013' '130114' '130316' '130417' '130619' '130821' '130922' '131217' '131419' '131722' '131924' '132017' '133019' '133625' '133827' '133928' '134324' '134425' '135225' '135528' '135730' '135932' '136227' '136732' '136833' '137027' '137128' '137229' '137633' '137936' '138231' '138534' '139839' '140824' '140925' '141119' '141422' '142828' '143325' '144428' '144731' '144832' '145834' '146331' '146432' '146937' '147636' '148032' '148133' '148335' '148941' '149236' '149337' '149539' '149741' '149842' '150726' '151223' '151324' '151425' '151526' '151627' '151829' '152225' '152831' '153025' '153429' '153631' '153833' '154229' '154330' '154431' '154532' '154734' '154835' '154936' '155938' '156233' '156334' '156637' '157336' '157437' '157942' '158035' '158136' '158338' '158540' '159138' '159239' '159340' '159441' '160123' '160729' '161327' '161731' '162026' '162228' '162329' '162935' '163129' '163331' '163836' '164030' '164131' '164636' '164939' '165032' '165638' '165840' '166640' '167036' '167743' '168240' '168341' '169040' '169343' '169444' '171330' '171532' '171633' '172029' '172130' '172332' '172534' '172938' '173334' '173435' '173536' '173637' '173940' '174437' '174841' '175237' '175338' '175439' '175540' '175742' '176037' '176542' '177645' '178142' '178243' '178748' '178950' '179245' '179346' '180129' '180432' '180735' '180937' '181636' '182436' '182739' '183034' '185139' '185341' '185442' '185846' '185947' '186141' '186444' '187143' '187345' '187547' '187850' '188347' '188549' '188751' '189349' '189450' '190031' '191033' '191235' '191336' '191437' '192035' '192439' '192540' '192641' '192843' '193239' '194140' '194645' '194746' '195041' '195445' '195647' '195950' '196144' '196750' '197348' '197550' '198350' '198451' '198653' '198855' '199150' '199251' '199453' '200008' '200109' '200311' '200614' '201111' '201414' '201818' '202113' '203923' '204016' '204319' '204420' '204521' '204622' '205119' '205220' '205725' '205826' '206525' '206727' '207123' '207426' '208024' '208125' '208226' '208327' '209127' '209228' '209834' '209935' '210011' '210415' '210617' '211114' '211316' '211417' '211821' '211922' '212116' '212217' '212318' '212419' '212823' '214019' '214221' '214423' '214524' '214726' '217126' '217429' '219231' '220721' '221319' '223929' '227432' '228434' '233326' '239136' '239944' '245333' '246133' '248339' '249947' '250427' '250932' '251833' '255639' '255740' '256540' '257845' '263436' '268749' '268850' '275645' '283543' '285345' '285446' '286650' '287248' '289555' '290136' '293748' '295146' '298051' '298455' '300618' '303119' '303624' '304020' '304727' '305830' '307127' '309636' '310621' '311320' '316633' '316835' '318637' '322224' '329440' '329844' '330324' '333330' '334635' '341834' '342129' '346137' '346945' '348545' '349244' '352132' '352738' '353740' '356948' '358144' '361941' '365343' '366042' '366446' '368551' '371843' '377451' '378857' '379657' '380036' '381038' '381543' '385450' '387959' '389357' '390645' '392447' '395958' '397154' '397760' '397861' '406432' '406836' '412528' '414229' '422632' '424939' '429040' '432332' '436239' '436845' '441939' '445543' '448347' '456346' '459453' '467351' '475855' '479762' '481951' '485757' '486759' '495255' '497865' '499566' '500222' '510225' '512835' '513736' '519950' '520228' '523032' '524135' '525541' '529549' '529953' '530635' '531536' '536647' '540436' '541640' '541943' '545345' '547046' '548250' '555348' '557857' '559053' '561242' '562345' '562446' '565452' '566454' '567052' '567961' '568963' '570243' '571144' '572045' '573249' '573451' '579665' '579867' '580044' '580650' '580751' '581349' '581450' '583858' '585862' '586460' '587664' '588565' '592455' '594156' '598568' '599065' '599671' '601127' '611938' '613538' '615744' '620434' '623844' '626648' '627852' '633847' '638049' '645450' '645551' '654350' '654754' '656253' '660951' '665254' '667056' '668361' '671855' '672756' '673455' '677766' '677968' '679568' '679770' '680250' '680957' '683256' '685058' '687163' '690152' '695768' '700634' '702133' '704238' '705341' '707749' '713239' '715041' '715647' '715950' '720337' '725751' '727553' '727654' '729254' '729557' '732243' '735148' '737960' '742549' '748258' '748662' '749361' '751348' '753251' '756055' '759869' '761957' '765056' '769064' '770352' '773257' '782561' '784565' '788876' '789373' '792564' '793465' '800941' '802844' '803240' '814649' '816653' '820745' '825048' '826353' '826454' '833148' '833249' '837560' '837964' '841349' '844961' '845458' '849264' '849971' '852455' '856766' '856968' '857263' '859671' '861456' '865363' '867468' '870861' '871762' '871964' '872158' '872562' '873968' '877168' '877269' '878776' '878877' '882161' '884064' '885975' '887373' '889579' '891667' '894067' '894673' '894774' '896778' '896879' '898176' '899885' '901038' '901139' '901442' '904044' '907656' '910241' '912447' '917255' '922854' '923755' '926862' '930449' '932554' '937160' '942658' '947668' '951457' '952863' '955465' '959574' '965771' '971160' '978578' '979984' '983773' '984472' '990366' '991267' '992774' '993675' '996782'};

% REST
outputfolder='Connmats/Rest/';
inputfolder='ParcellatedData/Rest/';

for sub=1:length(subs)
    
    disp(subs{sub})
    
    % Load timeseries
    emo_tslr=ciftiopen(strcat(inputfolder, subs{sub}, '_EMOTION_LR_bfcorrected.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    emo_tslr=emo_tslr.cdata';
    emo_tsrl=ciftiopen(strcat(inputfolder, subs{sub}, '_EMOTION_RL_bfcorrected.ptseries.nii'), '/Applications/workbench/bin_macosx64/wb_command');
    emo_tsrl=emo_tsrl.cdata';
    
    % Demean
    emo_tslr_demean=normalize(emo_tslr,'center','mean');
    emo_tsrl_demean=normalize(emo_tsrl,'center','mean');
    
    % Concatenate
    emo_tsmerge_demean=[emo_tslr_demean; emo_tsrl_demean];
    
    % Create the matrices at optimal lambda
    netmat=nets_netmats(emo_tsmerge_demean,1,'ridgep', 0.7);  % Ridge Regression partial
    
    % Save
    csvwrite(strcat(outputfolder, subs{sub}, '_REST_connmat_optL2.csv'), netmat);
    
end
