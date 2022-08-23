import 'package:flutter/material.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/spacers.dart';

class NonOpioidAdjuncts extends StatelessWidget {
  const NonOpioidAdjuncts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 4,
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))
      ,clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Non-Opioid Adjuncts",style:headingFont),
            smallVSpacer,
            
            Text("Opioids are useful pain medications for patients with acute pain.   Remember to counsel patients about opioid side effects.   Encourage co-usage opioid alternatives as a balanced approach to treating pain.   Non-opioid adjuncts may be other medications or may be non-pharmacologic interventions such as activity, physical therapy, or interventions that affect mood.  Identify a “pain goal” to guide usage: medications may be used with activity goals in mind in order to give context to their usage.  Encourage a plan to transition to alternatives when opioid medications are no longer needed.  Create a plan for what to do with leftover opioids when they are no longer needed.  It is important to counsel patients on proper opioid disposal as this can be confusing for physicians and patients alike.",style:regularText),
            midVSpacer,
            Text("Consider some of these recommendations as appropriate for your patients:",style:regularText),
            midVSpacer,
            Text("Scheduled acetaminophen (Tylenol) for three days\nAnti-inflammatory medications (NSAIDS)\nMuscle relaxants\nAnti-depressants\nother mood modifying medications or behaviors\nphysical activity\nphysical therapy\nusing medications before activity or before important things the patient wants to do\nhaving a pain goal to give context to dosing\nnerve blocks or injections\ntransdermal lidocaine\nTENS (transdermal electrical stimulation), or other distraction",style: regularText,)
          ],
        ),
      )),
    );
  }
}