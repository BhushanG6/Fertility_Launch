import 'package:flutter/material.dart';
//import 'package:swipedetector/swipedetector.dart';
import '../models/symptoms_model.dart';
import '../models/globals.dart' as globals;

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  List<SymtomsModel> items = [
    SymtomsModel(
        name: 'Pelvis Pain',
        tapcount: 0,
        description:
            'This is the pain that occurs in your pelvis, i.e the lowest part of your stomach. The pain occurs in the region under your belly button and between your hips. It is primarily the pain arising from the reproductive organs.\nIt occurs as a steady or unsteady manner. It may also be a sharp, stabbing pain in the region or a muted pain throughout the pelvis. This may occur even during sexual intercourse, menstruation or even during pregnancy.\nContinuous pain of the pelvis could be an indication of a problem in the organs in your pelvic area. This pain could also occur during ovulation when the egg is released from the ovary. In case the pain is experienced for a long period of time, it is best to consult your doctor.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Cramps',
        description:
            'A sudden painful, tightening of muscles in the region of the lower stomach usually occurring during the first and second day of the menstrual cycle is referred to as menstrual cramps. As your periods become more regular, these cramps are more likely.\n\nThis is mainly caused by the contractions of the uterus as it expels clotted blood and the uterine lining through the cervix. Pain relieving medication may also be taken after consulting with a physician. Severe menstrual cramps coupled with excessive bleeding and the passage of large blood clots, can occasionally be a sign of endometriosis or other related disorders.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Tender Breasts',
        description:
            'When your breasts feel swollen, lumpy and sometimes painful, it could indicate a classic case of tender breasts. This may result in the breasts feeling sore and sometimes occur as chest pain. The pain may also tend to increase with age.\n\nThis pain is mainly caused due to the increase in the levels of progesterone and estrogen and its effect on the milk glands. This may also be felt during pregnancy.The pain may occur due to cyclical or non-cyclical reasons(like injury, etc.). It is essential to identify the type of pain one is going through and acting accordingly. In case of non-cyclic pain, do consult with a doctor. If one feels a hard, lumpy growth in their breasts, one must immediately contact a gynecologist.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Headache',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Acne',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Backache',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Nausea',
        description:
            'Nausea is the constant feeling of discomfort in the stomach accompanied by an inclination to vomit leading to a feeling of heaviness, tightness and indigestion. This is common during the period and is not expected to last more than two days.\n\nFeeling nauseous during your period is completely normal. Such feelings arise due to an increase in the levels of prostaglandins in your body which occur during this time. It is normal to feel sick during your period and certain over the counter drugs may also be used to relieve these sensations. In case the sense of nausea causes great discomfort during your period, it is best to consult a health practitioner to identify the possibility of an underlying problem.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Fatigue',
        description:
            'Fatigue is the feeling of extreme tiredness. Basically, when you feel like you have no energy left even if you haven\'t done equivalent work. It is a normal phenomenon during the entire duration of your cycle.\n\nHeavy bleeding causes fatigue. Heightened by the decrease in oestrogen that occurs during the period, fatigue is a very common symptom of PMS. Changes in diet, regular exercise and effective stress management may be some ways to tackle this. On its own, it is not something to worry about.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Bloating',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Cravings',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Insomnia',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Constipation',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Diarrhea',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'PMS',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Vaginal Discharge',
        description:
            'Refers to a combination of fluids and cells that are continuously expelled through the vagina. This appears as a cloudy, slimy, white discharge and occurs a few days prior to the period.\n\n Discharge mainly can be any kind of non-period fluid that leaves the body. It can range from slimy to sticky and  wet to dry, occurring due to the increase in estrogen just before the period. It is best to record and track the days of occurrence of vaginal discharge in order to understand & treat it. Maintaining hygiene during this phase is of utmost importance.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'No sex drive',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Hot Flashes',
        description:
            'A sudden feeling of feverish heat that occurs anywhere between a few minutes to a few times a week is referred to as hot flashes. Here, a sudden feeling of warmth in the upper body is usually more intense in the face, neck and chest areas.\n\nThis feeling is also accompanied with sweating. Hot flashes are normal during PMS for some and in some cases it could also indicate the approaching of menopause. Staying hydrated along with avoiding spicy food, alcohol and smoking can help to improve these flashes. If you experience these before your thirties, it is best to consult with a doctor regarding the same.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Ovulation Pain',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'BP high',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'BP low',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Dizzy',
        description:
            'A sensation of spinning around, lightheadedness or losing body balance can be experienced during the period. The level of this sensation may vary from person to person and from period to period.\n\nDizziness is also caused primarily because of changes in the hormonal levels in the body during this time. Other conditions such as a low blood pressure may also be the main reasons for its occurrence. This may range from slight sensations to occurrences of fainting. Drinking plenty of water and taking the needed vitamins could help ease the sensation.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Fever',
        description:
            'Rise in the body temperature during your period can result in you having a fever during your period. Keep in mind that it is natural for the body to rise its temperature a little during menstruation. This is normally coupled with nausea and headache.\n\nFlu-like symptoms are very commonly experienced during periods and a large number of women experience this. This is usually accompanied with one or more PMS symptoms. It is natural to have a higher temperature during this time. Thus it is not something to worry about. If it occurs coupled along with more symptoms, then consult a doctor according to your discretion. ',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Gas',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Itch',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
  ];
  @override
  Widget build(BuildContext context) {
    int c;
    if ((4 * 43 + 3 * 20 + 2 * 13) <= MediaQuery.of(context).size.width) {
      c = 4;
    } else {
      c = 3;
    }
    return Container(
      child: Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: GridView.count(
            childAspectRatio: 1.05,
            crossAxisSpacing:
                (MediaQuery.of(context).size.width - 40 - 70 * 4) / 3,
            mainAxisSpacing:
                (MediaQuery.of(context).size.height - 110 - 70 * 6) / 5,
            crossAxisCount: c,
            children: List.generate(24, (index) {
              return Container(
                padding: items[index].tapcount == 3
                    ? EdgeInsets.all(0)
                    : items[index].tapcount == 2
                        ? EdgeInsets.all(0)
                        : items[index].tapcount == 1
                            ? EdgeInsets.all(6)
                            : EdgeInsets.all(6),
                height: 140,
                width: 140,
                child: Center(
                  child: GestureDetector(
                    onLongPress: () {
                      globals.getGridViewItems(context, items[index]);
                    },
                    onTap: () {
                      setState(() {
                        items[index].tapcount++;
                        print(items[index].tapcount);
                        if (items[index].tapcount == 4) {
                          items[index].tapcount = 0;
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: items[index].tapcount == 3
                              ? 91
                              : items[index].tapcount == 2
                                  ? 82
                                  : 66,
                          alignment: Alignment.center,
                          decoration: items[index].tapcount == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/${items[index].image}.jpg')),
                                )
                              : items[index].tapcount == 1
                                  ? BoxDecoration(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      borderRadius: BorderRadius.circular(23),
                                    )
                                  : items[index].tapcount == 2
                                      ? BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(23),
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  'assets/images/1212.png')),
                                        )
                                      : BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  'assets/images/Screenshot (30).png')),
                                        ),
                        ),
                        items[index].tapcount == 0 || items[index].tapcount == 1
                            ? Align(
                                child:
                                    FittedBox(child: Text(items[index].name)),
                                alignment: Alignment(0.0, 1.69),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
