import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
//import 'package:swipedetector/swipedetector.dart';
import '../models/symptoms_model.dart';
import '../models/globals.dart' as globals;

class Moods extends StatefulWidget {
  @override
  _MoodsState createState() => _MoodsState();
}

class _MoodsState extends State<Moods> {
  List<SymtomsModel> items = [
    SymtomsModel(
        tapcount: 0,
        //tapcount:0,
        name: 'Calm',
        description:
            'The feeling of not being nervous, angry or not expressing strong emotions typically contributes to being calm. During your periods, there is a chance that you could be experiencing this more than usual.\n\nEven though periods are typically associated with strong feelings of emotion, it is also common for people to feel more calm than usual. This is mainly due to the increase in the sex hormones that result in a nerochemical change which results in a feeling of moderate emotions also known as a sense of calm during your period.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Happy',
        description:
            'Happiness is a feeling of pleasure and satisfaction. During your period, this emotion could also be felt more extremely than usual. During the entire menstrual cycle it is not unlikely for your mood to constantly change.\n\nDuring the follicular phase and ovulation, due to the rise in estradiol, it is more likely to feel happy during this time of the month. Like all the other moods, this is also an extreme emotion that happens to have a positive effect on your mental health. This feeling is mostly associated with PMS however, it can be experienced during your period as well.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Energetic',
        description:
            'A person is said to be energetic when he/she is highly active both physically and mentally. Enthusiasm, excitement etc could be signs of an energetic person. Women may feel energetic predominantly during their follicular phase.\n\nThis phase begins from the first day of menstruation and ends with ovulation. Usually post menstruation, there is a steady increase in estrogen. This causes a natural increase in energy levels. This increase is usually not a threat of any sorts on its own. However, care must be taken to look into the other symptoms that occur alongside this.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Cranky',
        description:
            'Crankiness is the feeling of being very irritable and distracted. This feeling can actually increase in women during their periods and during PMS.\n\nThis occurs due to the fluctuations in hormones that leads to mood swings and changes. This is very often not a symptom to be concerned about. It is however important to understand the fluctuations in your mood to handle it in extreme cases. Tracking down such feelings is usually very useful. In case this feeling is constant over a long period of time, one might be showing symptoms of PMDD(Premenstrual dysphoric disorder).',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Mood Swings',
        description:
            'Mood swings may be explained as a sudden noticeable change in one’s mood or emotional state. The signs are clear and obvious. You might feel on top of the world at one moment while the next moment you are angry and frustrated.\n\nDigging deep into the scientific aspect, this occurs due to dominance of either estrogen or progesterone. When any one of these hormones is in excess, women may experience mood swings. Excess estrogen may cause irritability or anger. Excess of progesterone may cause anxiety, weepiness etc. Drop in serotonin levels, which is also known as \‘happy chemical\’ can also cause mood swings. ',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Irritated',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Sad',
        description:
            'Feeling or showing sorrow or unhappiness constantly. Sadness can sometimes accompany periods and is usually normal for most women during PMS.\n\nThis feeling is sometimes accompanied by anxiety and irritation and other psychological inconveniences. On its own, it is a mild symptom that can be overlooked during PMS. Lifestyle changes and good personal care may help to relieve this feeling. It is also scientifically proven that sugar can help in uplifting your mood temporarily which is why it helps to pamper your sweet tooth during these times.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Anxious',
        description:
            'Showing excessive worry, nervousness or unease about something with an uncertain outcome. This feeling may be elevated during PMS and thus it is important to be aware about this phenomenon.\n\nPremenstrual dysphoric disorder (PMDD) is a health problem that is similar to premenstrual syndrome (PMS) but is more serious. PMDD causes severe irritability, depression, or anxiety in the week or two before your period starts. Symptoms usually go away two to three days after your period starts. If the symptoms continue to persist, they may also cause more significant mental health issues and so medical help is always advised in such a case.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Depressed',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Guilty',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'guilty'),
    SymtomsModel(
        tapcount: 0,
        name: 'Obsessive Thoughts',
        description:
            'The inability to gain control over recurrent, distressing and distracting thoughts. This exhibits a complex network of feelings, sensations and behavioral routines.\n\nObsessive thoughts have been known to occur occasionally during PMS due to the hormonal changes. This affects women in various levels and cannot be compared or quantified. It is usually temporary but may have more major effects when accompanied with pre-existing mental illnesses.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Apathetic',
        description:
            'This is an intense feeling when one lacks the motivation or desire to act. This is common during the period and is not expected to last beyond the period.\n\nDuring a period, the person loses a lot of blood and as a result experiences low levels of iron in the body. This inevitably leads to a feeling of tiredness and fatigue and the continuation of such feelings leads to one becoming apathetic. It is always best not to strain yourself much during these days.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Confused',
        description:
            'This is when one lacks the clarity of choice. One may feel more confused than normal during the premenstrual phase of the cycle.\n\nThis is mostly experienced along with other feelings of emotional instability. The levels of such feelings may vary from individual to individual. Knowing that such a feeling is normal could also greatly reduce the anxiety that it brings along.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Self Critical',
        description:
            'A feeling of judging yourself rather harshly and with less consideration. One may become self critical during PMS and also during the period itself.\n\nThis is primarily an emotion that occurs alongside anger and irritation during the period. This is usually a normal phenomena. The severity of this feeling may also be a sign of premenstrual dysphoric disorder in some cases. Most of the time, it is temporary but in cases where the person has anxiety disorders, this feeling may prolong.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Angry',
        description:
            'Feeling or showing of rage or anger. Feelings like these could be elevated beyond reason during and before menstruation as a result of hormonal fluctuations.\n\nGetting angry during periods is normal. However, if it is accompanied by feelings of irritability and tension, it could be called menstrual rage. Menstrual rage is a symptom of Premenstrual dysphoric disorder (PMDD). These symptoms are more severe as compared to those experienced during premenstrual syndrome (PMS).',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Confident',
        description:
            'Confidence is a feeling of being very comfortable and secure in your own self and the lack of it could sometimes affect your life. Sometimes women tend to experience a change in their confidence levels nearing their period.\n\nJust before your period, your testosterone levels dip and this in turn results in a dip in your confidence levels as well. This feeling is usually non-persistent. However, coupled with feelings of depression and anxiety, this may stain one mentally and emotionally.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Emotional',
        description:
            'Feeling of extreme happiness or sadness, triggered by an event, but with an intensity far more than normal. In a nutshell, it is the feeling of extreme emotions.\n\nThis is commonly associated with PMS. This occurs as a highly difficult situation to deal with not only for oneself but also the people associated with them. This feeling is also very common and does not need to be taken as something to worry about, unless its frequency of occurrence is not uniform.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Frustrated',
        description:
            'A feeling of undirected anger having no particular basis. This occurs when the person experiences a feeling of extreme irritation when faced with even day to day processes.\n\nThis feeling is noted to increase during menstruation and PMS due to the change in certain sex hormones. This is common and need not necessarily indicate a deeper problem.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'High sex drive',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Sleppy',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Lazy',
        description:
            'Laziness is a feeling of disinterest and lack of interest leading to not being productive. This can occur due to a various number of physical as well as emotional factors. The basis of this can be found to be hormonal by tracking its occurrence.\n\nThis is not something to be worried about generally but if it is causing your productivity to be deterred, then it is best to start tracking its occurrence. The hormonal basis of laziness can only be determined by tracking its occurrence from period to period. Laziness is not generally a physical symptom but improving your lifestyle can help to eliminate the feeling.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Stressed',
        description:
            'Stress can be defined as any kind of change which can cause physical, emotional or a psychological strain. Agitation, frustration etc. are some of the signs of stress.\n\nStress during periods is usually because of the varying hormone levels. Women with moderate to severe PMS may have a tough time dealing with stress as it may worsen PMS. However excessive stress may cause a huge change in a woman\’s menstrual cycle resulting in problems like missed periods. If this is the case, try consulting a therapist or any other medical professional.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Unfocused',
        description:
            'The condition of being constantly distracted and unable to maintain concentration. Feeling spacey could occur during periods and PMS. \n\nPeriods do not in any way affect the way your brain functions. However, being unfocused could be due to the extreme tiredness, fatigue, mood swings and other changes experienced during the period that increases irritation. Meditation and other basic relaxation techniques can help reduce this feeling.',
        image: 'user1'),
    SymtomsModel(
        tapcount: 0,
        name: 'Spacy',
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                          child: items[index].image == 'guilty' &&
                                  items[index].tapcount == 0
                              ? FlareActor("assets/images/guilty.flr",
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  animation: "idle")
                              : SizedBox(),
                          height: items[index].tapcount == 3
                              ? 91
                              : items[index].tapcount == 2
                                  ? 82
                                  : 66,
                          alignment: Alignment.center,
                          decoration: items[index].image == 'guilty' &&
                                  items[index].tapcount == 0
                              ? BoxDecoration(
                                  border: items[index].image == 'guilty' &&
                                          items[index].tapcount == 0
                                      ? Border.all(color: Colors.black54)
                                      : null,
                                  borderRadius: BorderRadius.circular(23),
                                )
                              : items[index].tapcount == 0
                                  ? BoxDecoration(
                                      border: items[index].image == 'guilty' &&
                                              items[index].tapcount == 0
                                          ? Border.all(color: Colors.black54)
                                          : null,
                                      borderRadius: BorderRadius.circular(23),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            //items[index].image != 'guilty'?
                                            AssetImage(
                                                'assets/images/${items[index].image}.jpg'),
                                      ),
                                    )
                                  : items[index].tapcount == 1
                                      ? BoxDecoration(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          borderRadius:
                                              BorderRadius.circular(23),
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
