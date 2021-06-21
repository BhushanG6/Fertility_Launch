
Map<String,bool> flow={'Light':false,'Medium' :false, 'Heavy':false,'Spotted':false};
Map<String,bool> pill={'Taken':false,'Missed' :false, 'Late':false,'Double':false};
Map<String,bool> preg={'Negative':false,'Positive' :false};
Map<String,bool> ovu={'Negative':false,'Positive' :false};
Map<String,bool> selectval={'Creamy':false,'Egg' :false, 'Watery':false,'Sticky':false,'Dry':false};

bool flowchange=false;
bool dischargechange=false;
bool testchange=false;
bool pillchange=false;
bool notechange=false;

String note;

var flowData,pillData,testovData,testprData, disData,noteData;

final String id="asdfwer12423525as";
final List flowList=['light','medium','heavy','spotting'];
final List disList=["dry","sticky","creamy","watery","eggWhite"];
final List pillList=['taken','missed','late','double'];

bool on=false;

final String baseUrl='https://project31-heroku.herokuapp.com/api/v11/user/patient';