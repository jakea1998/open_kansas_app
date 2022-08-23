import 'package:flutter/material.dart';
import 'package:open_kansas/utils/fonts.dart';
import 'package:open_kansas/utils/spacers.dart';

class OpioidCalculatorInfo extends StatefulWidget {
  const OpioidCalculatorInfo({ Key? key }) : super(key: key);

  @override
  State<OpioidCalculatorInfo> createState() => _OpioidCalculatorInfoState();
}

class _OpioidCalculatorInfoState extends State<OpioidCalculatorInfo> {

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
            Text("IV to PO opioids – Equivalency",style:headingFont),
            smallVSpacer,
            Text('Definition',style:subheadingFont),
            Text("Inter-converting between oral and IV opioids is a very common situation encountered in both in treating acute perioperative pain and in discharging patients.  In order to determine equivalency between opioid agents, equianalgesic dosing tables are utilized in order to convert dosing between route of administration in the same agent or to calculate equivalent dosing between agents. Potency between oral and parenteral preparations of the same agent are dependent on the oral bioavailability of the drug which is related to the degree that it undergoes first pass metabolism via the liver before entering the systemic circulation.  Determining equivalency between different opioid agents is however more complex and published equianalgesic dosing tables are not standardized and often provide varied information.  This equianalgesic data aims to provide relative potency information between different opioids, which can be defined according to Knotkova et al. as “the ratio of opioid doses necessary to obtain roughly equivalent [analgesic] effects”. This data was derived from various randomized, controlled, clinical trials conducted in the 1950s and 1960s with typically a partial cross over design where morphine (IV or PO) was used as the standard for comparison in order to derive relative potency information. This data collected over 50 years ago was published as equianalgesic opioid dosing tables that have remained mostly unchanged. This data however has limitations as the study population primary included patients with acute post operative pain and that were relatively opiate naive which calls into question whether this data can truly be applied to populations on chronic and large doses of opioids.  In fact, more recent data demonstrates that these conversion ratios may be too simplistic and can vary based on many factors such as chronicity of opioid use, total daily dose, ethnicity, age, and can even differ depending on the direction of conversion (i.e. conversion from morphine to hydromorphone ¹ hydromorphone to morphine). Increasing research in the area of pharmacogenetics examines how genetic polymorphisms of liver metabolic enzymes can explain some of these highly variable effects seen from patient to patient. An expert panel (Fine et al.) suggested the need to revise these tables with different conversion values that take into account this complexity. In addition updated approaches on opioid switching have been discussed in several resources. Of particular note are substantial changes to calculations when converting to PO methadone, which is more potent than originally thought. Due to potential for serious adverse patient outcomes equianalgesic dose calculations are now adjusted based on the total daily dose of morphine equivalents with higher daily doses requiring increasingly less methadone.  Below is a suggested approach to switching opioid agents adapted from Fine et. al, Gammaitoni et al. and Vadivelu, N. et al. with an emphasis on individualization for each patient.",style:regularText),
          ],
        ),
      )),
    );
  }
}