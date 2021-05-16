import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

import './api/mns_api.dart';
import './loader.dart';

bool isLoading = false;

//below the 1st item is img, 2nd is name, 3rd is number of taps, 4 is id
//the 4th one is used to place the img and name column properly as it is a stack
List<List> symptoms = [
  ['assets/doctor2.jpg', 'Pelvis Pain', 0, 0],
  ['assets/aa/cramps.png', 'Cramps', 0, 1],
  ['assets/aa/tender_breast.png', 'Tender Breasts', 0, 2],
  ['assets/aa/headache.png', 'Headache', 0, 3],
  ['assets/aa/acne.png', 'Acne', 0, 0],
  ['assets/aa/backache.png', 'Backache', 0, 1],
  ['assets/doctor2.jpg', 'Nausea', 0, 2],
  ['assets/aa/fatigue.png', 'Fatigue', 0, 3],
  ['assets/aa/bloating.png', 'Bloating', 0, 0],
  ['assets/aa/craving.png', 'Cravings', 0, 1],
  ['assets/aa/insomnia.png', 'Insomnia', 0, 2],
  ['assets/aa/constipation.png', 'Constipation', 0, 3],
  ['assets/aa/diarreha.png', 'Diarrhea', 0, 0],
  ['assets/aa/low_sex_drive.png', 'Low Sex Drive', 0, 1],
  ['assets/aa/vaginal_discharge.png', 'Vaginal Dryness', 0, 2],
  ['assets/doctor2.jpg', 'No sex drive', 0, 3],
  ['assets/aa/hot_flashes.png', 'Hot Flashes', 0, 0],
  ['assets/aa/ovulution_pain.png', 'Ovulation Pain', 0, 1],
  ['assets/doctor2.jpg', 'BP high', 0, 2],
  ['assets/doctor2.jpg', 'BP low', 0, 3],
  ['assets/aa/dizzy.png', 'Dizzy', 0, 0],
  ['assets/aa/fever.png', 'Fever', 0, 1],
  ['assets/aa/gas.png', 'Gas', 0, 2],
  ['assets/aa/etching.png', 'Itch', 0, 3],
];

List<List> moods = [
  ['assets/aa/calm.png', 'Calm', 0, 0],
  ['assets/aa/happy.png', 'Happy', 0, 1],
  ['assets/aa/stress.png', 'Stressed', 0, 2],
  ['assets/doctor2.jpg', 'Unfocused', 0, 3],
  ['assets/aa/energetic.png', 'Energetic', 0, 0],
  ['assets/aa/cranky.png', 'Cranky', 0, 1],
  ['assets/aa/moodswings.png', 'Mood Swings', 0, 2],
  ['assets/aa/irritated.png', 'Irritated', 0, 3],
  ['assets/aa/sad.png', 'Sad', 0, 0],
  ['assets/aa/anxious.png', 'Anxiety', 0, 1],
  ['assets/aa/depressed.png', 'Depressed', 0, 2],
  ['assets/aa/obssessive.png', 'Obsessive thoughts', 0, 3],
  ['assets/aa/apathetic.png', 'Apathetic', 0, 0],
  ['assets/doctor2.jpg', 'Confused', 0, 1],
  ['assets/aa/self_crytical.png', 'Self critical', 0, 2],
  ['assets/aa/angry.png', 'Angry', 0, 3],
  ['assets/aa/confident.png', 'Confident', 0, 0],
  ['assets/aa/emotional.png', 'Emotional', 0, 1],
  ['assets/aa/frustrated.png', 'Frustrated', 0, 2],
  ['assets/aa/high_sex_drive.png', 'High sex drive', 0, 3],
  ['assets/aa/low_sex_drive.png', 'Low sex drive', 0, 0],
  ['assets/aa/sleepy.png', 'Sleepy', 0, 1],
  ['assets/aa/lazy.png', 'Lazy', 0, 2],
  ['assets/aa/etching.png', 'Itch', 0, 3],
];

List<String> symptomsDes = [
  'This is the pain that occurs in your pelvis, i.e the lowest part of your stomach. The pain occurs in the region under your belly button and between your hips. It is primarily the pain arising from the reproductive organs.\nIt occurs as a steady or unsteady manner. It may also be a sharp, stabbing pain in the region or a muted pain throughout the pelvis. This may occur even during sexual intercourse, menstruation or even during pregnancy.\nContinuous pain of the pelvis could be an indication of a problem in the organs in your pelvic area. This pain could also occur during ovulation when the egg is released from the ovary. In case the pain is experienced for a long period of time, it is best to consult your doctor.',
  'A sudden painful, tightening of muscles in the region of the lower stomach usually occurring during the first and second day of the menstrual cycle is referred to as menstrual cramps. As your periods become more regular, these cramps are more likely.\n\nThis is mainly caused by the contractions of the uterus as it expels clotted blood and the uterine lining through the cervix. Pain relieving medication may also be taken after consulting with a physician. Severe menstrual cramps coupled with excessive bleeding and the passage of large blood clots, can occasionally be a sign of endometriosis or other related disorders',
  'When your breasts feel swollen, lumpy and sometimes painful, it could indicate a classic case of tender breasts. This may result in the breasts feeling sore and sometimes occur as chest pain. The pain may also tend to increase with age.\n\nThis pain is mainly caused due to the increase in the levels of progesterone and estrogen and its effect on the milk glands. This may also be felt during pregnancy.The pain may occur due to cyclical or non-cyclical reasons(like injury, etc.). It is essential to identify the type of pain one is going through and acting accordingly. In case of non-cyclic pain, do consult with a doctor. If one feels a hard, lumpy growth in their breasts, one must immediately contact a gynecologist',
  'Headache is a very common symptom that women experience prior or post their menstruation. There are two kinds of headaches you might experience. One, because of stress, primarily in the forehead. The other may be due to blood loss and a drop in iron levels.\nAlthough, there is no clear cause stated by the experts, the predominant reason is believed to be a change in hormonal levels. A drop in Estrogen levels can plummet headaches.\nWomen having a history of migraines are more prone to menstrual migraines. This usually begins 2 or 3 days before the periods and may go upto a couple of days post periods. But there may be some other causes of headaches which includes a poor sleep schedule, stress etc. Headaches can also be a result of some side effects of  Birth control pills, antidepressants etc',
  'Acne is a skin condition which occurs when there is a formation of dead skin cells. Acne can have various signs such as pimples, cysts, whiteheads, blackheads etc. It forms a pinkish red patch over the skin.\n\nA major chunk of women experience acne breakouts during their menstrual cycle. This is due to the varying hormone levels which causes excess oil production and hence causing acne breakouts. However if you experience acne breakouts every now and then it is better to go to a dermatologist for a consultation',
  'Lower back pain is a common symptom of PMS. It is normally experienced in the lower back portion as a cramping or aching pain. This happens mainly because the pain from the lower abdominal region radiates to the back.\n\nLow back pain could also sometimes be used as an indication of pregnancy. This is normally caused due to an increase in the prostaglandin levels that is seen to occur during periods. Thus it is considered normal and is not expected to stay after the second day of the period. It may cause large amounts of discomfort and the pain may sometimes also radiate down to the legs',
  'Nausea is the constant feeling of discomfort in the stomach accompanied by an inclination to vomit leading to a feeling of heaviness, tightness and indigestion. This is common during the period and is not expected to last more than two days.\n\nFeeling nauseous during your period is completely normal. Such feelings arise due to an increase in the levels of prostaglandins in your body which occur during this time. It is normal to feel sick during your period and certain over the counter drugs may also be used to relieve these sensations. In case the sense of nausea causes great discomfort during your period, it is best to consult a health practitioner to identify the possibility of an underlying problem',
  "Fatigue is the feeling of extreme tiredness. Basically, when you feel like you have no energy left even if you haven't done equivalent work. It is a normal phenomenon during the entire duration of your cycle.\n\nHeavy bleeding causes fatigue. Heightened by the decrease in oestrogen that occurs during the period, fatigue is a very common symptom of PMS. Changes in diet, regular exercise and effective stress management may be some ways to tackle this. On its own, it is not something to worry about",
  'Bloating is referred to a general abnormal swelling(primarily due to gas) in the lower abdomen and is also a very usual symptom of menstruation.\n\nExperts believe that bloating during menstruation is primarily because of high levels of prostaglandins that are released. These prostaglandins cause uterus contractions which limits bowel movement causing the bowels to accumulate which in turn causes bloating.Another reason could be ‘Water Retention’. This problem rises due to the decreasing levels of progesterone during menstruation. This causes water and salt retention which in turn causes swelling in the body cells which gives you the feeling of bloating. We can also note that bloating can be a symptom of early pregnancy. But if this continues for more than a few days, it’s better to consult a doctor',
  "Strong urges to want something especially related to food during the time of PMS, is a sign of craving. A feeling like this usually occurs a week or two prior to menstruation. It may display both strong and weak feelings.\n\nA common phenomena that occurs 8-14 days before your period. Normally, it is caused due to the fluctuating hormone and serotonin levels during a woman's cycle. Hormones may even result in the drop in sugar levels and thus result in such a feeling. It is completely normal to experience this. Craving is a classic symptom of PMS",
  'Insomnia can be defined as persistent difficulty in initiating sleep or staying asleep. Insomnia can be chronic as well as short term. Women, during their menstrual cycle may experience insomnia before or during their period.\n\nThis is primarily due to varying hormone levels which affects melatonin production which is responsible for our sleep architecture. Women with PMS are twice as prone to insomnia as compared to others. Insomnia can in turn cause problems like stress, fatigue, mood swings etc.Practicing relaxation techniques, staying hydrated, maintaining a proper sleep schedule etc can help fight insomnia extensively.',
  'Constipation may be defined as a difficulty in passing stools. Apart from abdominal cramps and bloating, constipation could be one such problem women may experience.\n\nIt is the hormone progesterone that plays its role here. Right before your period begins, the level of progesterone is at its peak. This causes the thickening of uterine walls, which in turn results in constipation.\n Although there may be some other factors which may influence constipation such as dietary changes, stress etc. Numerous women experience gastrointestinal problems during menstruation. Although very common, if these symptoms continue to affect you for a long time after your period ends, medical advice is highly recommended',
  'Diarrhea is a condition where a person may feel to pass stools more frequently than usual, the stools being primarily very loose and watery. This problem arises during your period when the progesterone levels are low and prostaglandins are high.\n\nProstaglandins causes uterus contractions and sometimes even causes contractions in your digestive system, thereby increasing the bowel movement leading to diarrhea. It could get worse if you are a coffee drinker. Caffeine acts as a laxative and can worsen diarrhea. Although cutting down on coffee and foods containing magnesium can help upto a huge extent, a brisk walk, low intensity exercise etc can help solve a lot of gastrointestinal issues during your periods. It is suggested that one should increase their fibrous food intake during these times.',
  'Lack or decrease in libido experienced for a person is termed as a low sex drive. If you are expessing a significantly lower sex drive as opposed to the usual, then it might be something to look into.\nLow sex drive can be due to certain physical as well as psychological reasons. Psychological issues can include depression, stress, and problems in your relationship. This can normally be overcome by simply adding new changes to your lifestyle',
  'Description of the disease/symptom/mood here',
  'Description of the disease/symptom/mood here',
  'A sudden feeling of feverish heat that occurs anywhere between a few minutes to a few times a week is referred to as hot flashes. Here, a sudden feeling of warmth in the upper body is usually more intense in the face, neck and chest areas.\n\nThis feeling is also accompanied with sweating. Hot flashes are normal during PMS for some and in some cases it could also indicate the approaching of menopause. Staying hydrated along with avoiding spicy food, alcohol and smoking can help to improve these flashes. If you experience these before your thirties, it is best to consult with a doctor regarding the same',
  'Referred to a one sided pain in the lower abdomen. Can either be in the right or the left side of the abdomen. Usually women experience a dull cramp(similar to menstrual cramps)  but sometimes can experience a sharp and sudden twinge as well. It can also accompany a slight vaginal discharge or bleeding.\n\nMedically known as ‘Mittelschmerz’, this is experienced by every 1 out of 3 women. Such pain is usually experienced 14 days prior to your menstrual period, when the ovulation occurs. The side of the pain may differ depending on which ovary releases the egg. Cramps can last ranging from a few minutes upto a day or two. If the pain lasts for a long time, medical consultation is absolutely recommended',
  'Blood pressure is defined as the rate at which the heart pumps blood in the arteries. Right before your period begins, the progesterone levels are at peak, which causes high BP, but there is no direct relationship of high BP with menstruation.\n\nIt is found that 40% of women having diagnosed with moderate to severe PMS are prone to High BP in the later stages of their life and may also experience symptoms like headaches, dizziness, flushing etc. The BP is normalized after the period gets over, but getting your BP checked regularly is very important since it has no specific symptoms and if not diagnosed at an early stage, can also cause heart complications',
  'Low Blood pressure may be defined as a condition the rate at which the heart pumps blood is slower than usual. Women may experience low BP at the middle of their periods. This is the period when the hormone levels are low, which reduces the fluids in the bloodstream This causes a sudden drop in the BP and a person may feel dizzy or can faint.\nWomen diagnosed with PMS may experience this. In some cases a woman may also experience swollen legs. However these are rare cases, and it is completely normal if all these symptoms fade away as your period ends. However keeping an eye on BP regularly is recommended.',
  'A sensation of spinning around, lightheadedness or losing body balance can be experienced during the period. The level of this sensation may vary from person to person and from period to period.\n\nDizziness is also caused primarily because of changes in the hormonal levels in the body during this time. Other conditions such as a low blood pressure may also be the main reasons for its occurrence. This may range from slight sensations to occurrences of fainting. Drinking plenty of water and taking the needed vitamins could help ease the sensation',
  'Rise in the body temperature during your period can result in you having a fever during your period. Keep in mind that it is natural for the body to rise its temperature a little during menstruation. This is normally coupled with nausea and headache.\n\nFlu-like symptoms are very commonly experienced during periods and a large number of women experience this. This is usually accompanied with one or more PMS symptoms. It is natural to have a higher temperature during this time. Thus it is not something to worry about. If it occurs coupled along with more symptoms, then consult a doctor according to your discretion.',
  'Gastric problems refers to acid reflux by the stomach. This causes a lot of other problems like excessive burps, excessive farts, bloating etc. This may also cause indigestion,nausea etc. Women may also experience a slight abdominal pain.\n\nWhen we relate gas to menstruation, the situation is different. Experts believe women experience gas before periods because of varying hormone levels. These hormones get trapped in the gastrointestinal tract and cause gastric problems.\nA healthy diet and a healthy lifestyle can be regarded to ease such problems',
  'This may result in itching or sometimes even pain in the regions just inside or around the vagina. This is commonly coupled with vaginal discharge and may cause a decent amount of irritation. There may be many reasons for its occurrence apart from menstruation.\n\nVaginal itching normally gets better on its own, however, if you are experiencing high levels of discomfort or if it comes even after treatment, it is best to get a pelvic exam done. This is often observed near the time of menopause as the vaginal walls start drying and thinning out.\nThe multiple other causes for this might be an STD, yeast infection or chemical irritant(eg. Condom, creams, chemical substances etc.).',
];

List<String> moodsDes = [
  'The feeling of not being nervous, angry or not expressing strong emotions typically contributes to being calm. During your periods, there is a chance that you could be experiencing this more than usual.\n\nEven though periods are typically associated with strong feelings of emotion, it is also common for people to feel more calm than usual. This is mainly due to the increase in the sex hormones that result in a nerochemical change which results in a feeling of moderate emotions also known as a sense of calm during your period.',
  'Happiness is a feeling of pleasure and satisfaction. During your period, this emotion could also be felt more extremely than usual. During the entire menstrual cycle it is not unlikely for your mood to constantly change.\n\nDuring the follicular phase and ovulation, due to the rise in estradiol, it is more likely to feel happy during this time of the month. Like all the other moods, this is also an extreme emotion that happens to have a positive effect on your mental health. This feeling is mostly associated with PMS however, it can be experienced during your period as well.',
  'Stress can be defined as any kind of change which can cause physical, emotional or a psychological strain. Agitation, frustration etc. are some of the signs of stress.\n\nStress during periods is usually because of the varying hormone levels. Women with moderate to severe PMS may have a tough time dealing with stress as it may worsen PMS. However excessive stress may cause a huge change in a woman’s menstrual cycle resulting in problems like missed periods. If this is the case, try consulting a therapist or any other medical professional.',
  'The condition of being constantly distracted and unable to maintain concentration. Feeling spacey could occur during periods and PMS.\n\nPeriods do not in any way affect the way your brain functions. However, being unfocused could be due to the extreme tiredness, fatigue, mood swings and other changes experienced during the period that increases irritation. Meditation and other basic relaxation techniques can help reduce this feeling.',
  'A person is said to be energetic when he/she is highly active both physically and mentally. Enthusiasm, excitement etc could be signs of an energetic person. Women may feel energetic predominantly during their follicular phase.\n\nThis phase begins from the first day of menstruation and ends with ovulation. Usually post menstruation, there is a steady increase in estrogen. This causes a natural increase in energy levels. This increase is usually not a threat of any sorts on its own. However, care must be taken to look into the other symptoms that occur alongside this.',
  'Crankiness is the feeling of being very irritable and distracted. This feeling can actually increase in women during their periods and during PMS.\n\nThis occurs due to the fluctuations in hormones that leads to mood swings and changes. This is very often not a symptom to be concerned about. It is however important to understand the fluctuations in your mood to handle it in extreme cases. Tracking down such feelings is usually very useful. In case this feeling is constant over a long period of time, one might be showing symptoms of PMDD(Premenstrual dysphoric disorder).',
  'Mood swings may be explained as a sudden noticeable change in one’s mood or emotional state. The signs are clear and obvious. You might feel on top of the world at one moment while the next moment you are angry and frustrated.\n\nDigging deep into the scientific aspect, this occurs due to dominance of either estrogen or progesterone. When any one of these hormones is in excess, women may experience mood swings. Excess estrogen may cause irritability or anger. Excess of progesterone may cause anxiety, weepiness etc. Drop in serotonin levels, which is also known as ‘happy chemical’ can also cause mood swings.',
  'A feeling of slight anger or annoyance which makes the person more likely to get frustrated even in mild situations. This could range in intensity from person to person and from period to period.\n\nA feeling of slight anger or annoyance which makes the person more likely to get frustrated even in mild situations. This could range in intensity from person to person and from period to period.\n\nPremenstrual dysphoric disorder (PMDD) is a health problem that is similar to premenstrual syndrome (PMS) but is more serious. PMDD causes severe irritability, depression, or anxiety in the week or two before your period starts. These symptoms usually go away two to three days after your period starts. If the symptoms continue to persist, they may also cause more significant mental health issues and so medical help is always advised in such a case.',
  'Feeling or showing sorrow or unhappiness constantly. Sadness can sometimes accompany periods and is usually normal for most women during PMS.\n\nThis feeling is sometimes accompanied by anxiety and irritation and other psychological inconveniences. On its own, it is a mild symptom that can be overlooked during PMS. Lifestyle changes and good personal care may help to relieve this feeling. It is also scientifically proven that sugar can help in uplifting your mood temporarily which is why it helps to pamper your sweet tooth during these times.',
  'Showing excessive worry, nervousness or unease about something with an uncertain outcome. This feeling may be elevated during PMS and thus it is important to be aware about this phenomenon.\n\nPremenstrual dysphoric disorder (PMDD) is a health problem that is similar to premenstrual syndrome (PMS) but is more serious. PMDD causes severe irritability, depression, or anxiety in the week or two before your period starts. Symptoms usually go away two to three days after your period starts. If the symptoms continue to persist, they may also cause more significant mental health issues and so medical help is always advised in such a case.',
  'Classified as a mood disorder, depression is described as having strong feelings of sadness, loss or anger usually for a constant period of time. The major difference of depression with sadness is that sadness is a feeling while depression is a mental health condition.\n\nPre-existing conditions of sadness and anxiety can be heightened to the stage of depression during these times. If the feeling is persistent, it could imply an underlying psychological situation and so a visit to the psychologist/psychiatrist is highly recommended. It is extremely crucial to reach out for help during these times. Reaching out to friends and family can also help in such cases.',
  'The inability to gain control over recurrent, distressing and distracting thoughts. This exhibits a complex network of feelings, sensations and behavioral routines.\n\nObsessive thoughts have been known to occur occasionally during PMS due to the hormonal changes. This affects women in various levels and cannot be compared or quantified. It is usually temporary but may have more major effects when accompanied with pre-existing mental illnesses.',
  'This is an intense feeling when one lacks the motivation or desire to act. This is common during the period and is not expected to last beyond the period.\n\nDuring a period, the person loses a lot of blood and as a result experiences low levels of iron in the body. This inevitably leads to a feeling of tiredness and fatigue and the continuation of such feelings leads to one becoming apathetic. It is always best not to strain yourself much during these days.',
  'This is when one lacks the clarity of choice. One may feel more confused than normal during the premenstrual phase of the cycle.\n\nThis is mostly experienced along with other feelings of emotional instability. The levels of such feelings may vary from individual to individual. Knowing that such a feeling is normal could also greatly reduce the anxiety that it brings along.',
  'A feeling of judging yourself rather harshly and with less consideration. One may become self critical during PMS and also during the period itself.\n\nThis is primarily an emotion that occurs alongside anger and irritation during the period. This is usually a normal phenomena. The severity of this feeling may also be a sign of premenstrual dysphoric disorder in some cases. Most of the time, it is temporary but in cases where the person has anxiety disorders, this feeling may prolong.',
  'Feeling or showing of rage or anger. Feelings like these could be elevated beyond reason during and before menstruation as a result of hormonal fluctuations.\n\nGetting angry during periods is normal. However, if it is accompanied by feelings of irritability and tension, it could be called menstrual rage. Menstrual rage is a symptom of Premenstrual dysphoric disorder (PMDD). These symptoms are more severe as compared to those experienced during premenstrual syndrome (PMS).',
  'Confidence is a feeling of being very comfortable and secure in your own self and the lack of it could sometimes affect your life. Sometimes women tend to experience a change in their confidence levels nearing their period.\n\nJust before your period, your testosterone levels dip and this in turn results in a dip in your confidence levels as well. This feeling is usually non-persistent. However, coupled with feelings of depression and anxiety, this may stain one mentally and emotionally.',
  'Feeling of extreme happiness or sadness, triggered by an event, but with an intensity far more than normal. In a nutshell, it is the feeling of extreme emotions.\n\nThis is commonly associated with PMS. This occurs as a highly difficult situation to deal with not only for oneself but also the people associated with them. This feeling is also very common and does not need to be taken as something to worry about, unless its frequency of occurrence is not uniform.',
  'A feeling of undirected anger having no particular basis. This occurs when the person experiences a feeling of extreme irritation when faced with even day to day processes.\n\nThis feeling is noted to increase during menstruation and PMS due to the change in certain sex hormones. This is common and need not necessarily indicate a deeper problem.',
  'High sex drive or increase in libido may be experienced in some perople during certain times. If you notice this to be higher than usual, then it is best to consult a medical professional.\n\nHigh sex drive is common to occur during the start of a relationship, sometimes during pergnancy and even during extreme psychological conditions. This could also be the result of excessive drugs in the body. This phenomena may imply hormonal imbalance. Medical help is highly advised.',
  'Lack or decrease in libido experienced for a person is termed as a low sex drive. If you are expessing a significantly lower sex drive as opposed to the usual, then it might be something to look into.\nLow sex drive can be due to certain physical as well as psychological reasons. Psychological issues can include depression, stress, and problems in your relationship. This can normally be overcome by simply adding new changes to your lifestyle.',
  'This when you feel sleepy even after getting the adequate required sleep. This may or may not be accompanied by feelings of laziness and tiredness.\n\nIt is expected to feel such symptoms during your periods as you are losing a large amount of blood and the hormones act in a way to make you feel tired and weary. It is important to maintain a healthy diet during these times.',
  'Laziness is a feeling of disinterest and lack of interest leading to not being productive. This can occur due to a various number of physical as well as emotional factors. The basis of this can be found to be hormonal by tracking its occurrence.\n\nThis is not something to be worried about generally but if it is causing your productivity to be deterred, then it is best to start tracking its occurrence. The hormonal basis of laziness can only be determined by tracking its occurrence from period to period. Laziness is not generally a physical symptom but improving your lifestyle can help to eliminate the feeling.',
  'This may result in itching or sometimes even pain in the regions just inside or around the vagina. This is commonly coupled with vaginal discharge and may cause a decent amount of irritation. There may be many reasons for its occurrence apart from menstruation.\n\nVaginal itching normally gets better on its own, however, if you are experiencing high levels of discomfort or if it comes even after treatment, it is best to get a pelvic exam done. This is often observed near the time of menopause as the vaginal walls start drying and thinning out.\nThe multiple other causes for this might be an STD, yeast infection or chemical irritant(eg. Condom, creams, chemical substances etc.).',
];

class MNS extends StatefulWidget {
  @override
  _MNSState createState() => _MNSState();
}

bool moodTab = false;
int swipes = 0;
//this variable is used to stop the swipe detector to triger multiple times

Widget renderImg(String img, {double height, bool shadow = false}) {
  // rive.Artboard art;
  Widget child = Image.asset(img, fit: BoxFit.cover);
  if (img.endsWith('svg')) {
    child = SvgPicture.asset(img, fit: BoxFit.cover);
  } else if (img.endsWith('flr')) {
    child = FlareActor(img, animation: 'Untitled', fit: BoxFit.cover);
  }
  /*else if (img.endsWith('riv')) {
      // _controller.isActive = true;
      if (img == 'assets/riveImg/hot_flashes.riv') {
        //uncomment this
        art = _riveArtboard2;
      } else if (img == 'assets/riveImg/Tender_breast.riv') {
        art = _riveArtboard3;
      } else {
        art = _riveArtboard;
      }

      child = art == null ? const SizedBox() : rive.Rive(artboard: art);
    }*/
  return Container(
    height: height ?? null,
    child: child,
  );
}

class Sheet extends StatefulWidget {
  @override
  _SheetState createState() => _SheetState();

  final bool dark;
  final gridItem;
  final scrollController;
  final String des;
  final MediaQueryData media;
  Sheet(
      {this.dark, this.gridItem, this.scrollController, this.des, this.media});
}

class _SheetState extends State<Sheet> {
  bool pixels =
      false; //used to remove the gradient when the users scrolls a little
  bool blurText = false;
  bool startList = false; //used to adding SizedBox or padding above the text

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.initialExtent == 0.6) {
          notification.extent == 1 ? startList = true : startList = false;
          if (notification.extent > 0.7) {
            pixels = true;
          } else {
            pixels = false;
          }
        }
        //the "else if" statement below was for draggable sheet the code for which is
        //copied to the requirements.txt for testing you can copy that code and paste
        //it after gradient container and remove the container below it
        else if (notification.initialExtent ==
            num.parse((widget.media.size.height / 1500).toStringAsFixed(3))) {
          if (notification.extent > 0.5) {
            blurText = true;
          } else {
            blurText = false;
          }
        }
        // if (widget.scrollController.position.pixels > 50 && !pixels) {
        //   setState(() {
        //     pixels = true;
        //   });
        // } else if (widget.scrollController.position.pixels < 50 && pixels) {
        //   setState(() {
        //     pixels = false;
        //   });
        // }
        // print(widget.scrollController.position.pixels);
        // print(scrollController.position.maxScrollExtent);
        return false;
      },
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Stack(children: [
          //photo and black or white bar in column
          Column(
            children: [
              //black or white small bar
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12), //8
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                        color: widget.dark ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              renderImg(widget.gridItem[0], height: 400),
            ],
          ),
          //
          //gradient
          Container(
            height: 430, //390
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  pixels //pixels == true
                      ? Colors.transparent
                      : widget.dark
                          ? Colors.black
                          : Colors.white,
                  widget.dark
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment(0, -0.35), //Alignment.topCenter
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, startList ? 0 : 380, 35, 0),
            // margin: EdgeInsets.only(top: 300, left: 35, right: 35),
            height: widget.media.size.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels > 50 && blurText != true) {
                  setState(() {
                    blurText = true;
                  });
                } else if (notification.metrics.pixels <= 50 &&
                    blurText == true) {
                  setState(() {
                    blurText = false;
                  });
                }
                // print(notification.metrics.pixels);
                return false;
              },
              child: ListView(
                controller: widget.scrollController,
                children: [
                  SizedBox(height: startList ? 380 : 0),
                  Container(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: blurText ? 16 : 0,
                            sigmaY: blurText ? 16 : 0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //yellow title
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 190),
                                    child: Text(
                                      widget.gridItem[1],
                                      style: TextStyle(
                                        color: Color(0xffE3B287),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(height: 24),
                              Text(widget.des, style: TextStyle(fontSize: 17)),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class Boxes extends StatefulWidget {
  @override
  _BoxesState createState() => _BoxesState();

  final bool dark;
  final List<List> list;
  final List<String> des;
  final width;
  final int i;
  Boxes({this.dark, this.list, this.des, this.width, this.i});
}

List<List<int>> items4 = [
  [0, 1, 2, 3],
  [4, 5, 6, 7],
  [8, 9, 10, 11],
  [12, 13, 14, 15],
  [16, 17, 18, 19],
  [20, 21, 22, 23],
];

List<List<int>> items3 = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [9, 10, 11],
  [12, 13, 14],
  [15, 16, 17],
  [18, 19, 20],
  [21, 22, 23]
];

class _BoxesState extends State<Boxes> {
  getGridViewItems2(BuildContext ctx, List gridItem, bool dark, String des) {
    MediaQueryData media = MediaQuery.of(ctx);
    return showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      backgroundColor: dark ? Colors.black : Colors.white,
      isScrollControlled: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          expand: false,
          builder: (ctx, scrollController) {
            return Sheet(
              dark: dark,
              gridItem: gridItem,
              des: des,
              media: media,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool dark = widget.dark;
    List<List> detail = widget.list;
    int i = widget.i;
    List temp = items4[i]; //[...items.getRange(4 * i, 4 * i + 4)];
    return Stack(children: [
      for (int v in temp) //for (int v = 4 * i; v < 4 * i + 4; v++)
        Positioned(
          left: detail[v][3] * widget.width / 4.12,
          // + widget.id*2 is just adjustment //removed it
          child: Container(
            width: 90,
            height: 114, //this is optional remove this
            padding: const EdgeInsets.only(top: 14),
            // height: 66 + 34.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      detail[v][2] += 1;
                      if (detail[v][2] == 4) {
                        detail[v][2] = 0;
                      }
                      //the below line is for setting the clicked item to last of the
                      //stack so it renders on top of the stack
                      int index = items4[i].indexOf(v);
                      int temp2 = items4[i][index];
                      items4[i].removeAt(index);
                      items4[i]
                          .insert(items4[i].indexOf(items4[i].last) + 1, temp2);
                    });
                  },
                  onLongPress: () => getGridViewItems2(
                      context, detail[v], dark, widget.des[v]),
                  child: Transform.translate(
                    offset: detail[v][2] <= 1
                        ? Offset(0, 0)
                        : detail[v][2] == 2
                            ? Offset(0, -8)
                            : Offset(0, -12),
                    child: Container(
                      decoration: detail[v][2] == 3
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [BoxShadow(blurRadius: 4)],
                            )
                          : null,
                      child: ClipRRect(
                        borderRadius: detail[v][2] == 3
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(24),
                        child: Container(
                          // width: detail[2] <= 1
                          //  ? 66
                          //  : detail[2]*2 + 66,
                          width: detail[v][2] > 1
                              ? detail[v][2] == 2
                                  ? 82
                                  : 90
                              : 66.0,
                          height: detail[v][2] > 1
                              ? detail[v][2] == 2
                                  ? 82
                                  : 90
                              : 66.0,
                          // width: detail[2] > 1 ? 74 : 66,
                          // height: detail[2] > 1 ? 74 : 66,
                          color: detail[v][2] == 2
                              ? Colors.transparent
                              : dark
                                  ? Colors.white
                                  : Colors.black,
                          child: detail[v][2] > 0
                              ? detail[v][2] == 1
                                  ? renderImg(detail[v][0])
                                  : detail[v][2] == 2
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 3,
                                                  color:
                                                      const Color(0x55000000)),
                                            ],
                                          ),
                                          child: ClipPolygon(
                                            child: Container(
                                              child: renderImg(detail[v][0]),
                                              // color: Colors.grey,
                                              color: dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                            sides: 9,
                                            borderRadius: 5,
                                          ),
                                        )
                                      : Container(
                                          child: renderImg(detail[v][0]),
                                        )
                              : Stack(
                                  children: [
                                    Container(
                                      width: 66,
                                      height: 66,
                                      child: renderImg(detail[v][0]),
                                    ),
                                    Container(
                                      color: Color(0xFF4C4C4C).withOpacity(0.6),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                detail[v][2] <= 1
                    ? Container(
                        width: 72,
                        child: Text(
                          detail[v][1],
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
    ]);
  }
}

class _MNSState extends State<MNS> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  _getSymptoms() async {
    setState(() => isLoading = true);
    await getData().then((value) {
      if (value['status'] == 'success') {
        symptoms[8][2] = value['data']['bloating'];
        symptoms[11][2] = value['data']['constipation'];
      }
    });
    setState(() => isLoading = false);
  }

  void initState() {
    super.initState();
    _getSymptoms();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    bool dark = media.platformBrightness == Brightness.dark;

    List list = moodTab ? moods : symptoms;
    List<String> description = moodTab ? moodsDes : symptomsDes;

    // print('${media.size.width}, ${media.size.height}');

    return isLoading
        ? MyLoader()
        : GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                if (swipes == 0) {
                  setState(() {
                    swipes += 1;
                    moodTab = false;
                    _controller.reverse();
                  });
                }
                //swiped right
              } else if (details.delta.dx < 0) {
                setState(() {
                  swipes = 0;
                  moodTab = true;
                  _controller.forward();
                });
              }
            },
            child: Scaffold(
              backgroundColor: dark ? Colors.black : Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    //top row
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Expanded(
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      swipes += 1;
                                      moodTab = false;
                                      _controller.reverse();
                                    });
                                  },
                                  child: Text(
                                    'Symptoms',
                                    style: moodTab
                                        ? TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF4C4C4C),
                                          )
                                        : TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(width: 23),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      swipes = 0;
                                      moodTab = true;
                                      _controller.forward();
                                    });
                                  },
                                  child: Text(
                                    'Moods',
                                    style: moodTab
                                        ? TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF4C4C4C),
                                          ),
                                  ),
                                ),
                                Spacer(),
                                Stack(children: [
                                  Container(
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              swipes = 0;
                                              moodTab = false;
                                              _controller.reverse();
                                            });
                                          },
                                          child: Container(
                                            width: 10, //moodTab ? 32 : 10
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF4C4C4C),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                        //inside BoxDecoration and color there will be:
                                        //moodTab ? dark ? Colors.white : Colors.black : Color(0xFF4C4C4C)
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF4C4C4C),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              swipes += 1;
                                              moodTab = true;
                                              _controller.forward();
                                            });
                                          },
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF4C4C4C),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Transform.translate(
                                          offset:
                                              Offset(_controller.value * 17, 0),
                                          child: child);
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color:
                                            dark ? Colors.white : Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 20), //35
                    //The grid of items
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < list.length / 4; i++)
                              Expanded(
                                // width: media.size.width - 60,
                                // height: 66 + 34.0,
                                child: Boxes(
                                  dark: dark,
                                  list: list /*[4 * i + v]*/,
                                  des: description /*[4 * i + v]*/,
                                  width: media.size.width - 42,
                                  i: i,
                                  //-60 as there is a margin of 30 from left & right
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
