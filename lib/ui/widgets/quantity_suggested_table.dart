import 'package:flutter/material.dart';
import 'package:open_kansas/ui/widgets/quantity_suggested_heading.dart';
import 'package:open_kansas/ui/widgets/quantity_suggested_row.dart';

class QuantitySuggestedTable extends StatelessWidget {
  const QuantitySuggestedTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? lightBlue = Colors.blue[100];
    return Card(
        margin: EdgeInsets.only(left: 12, right: 12, top: 12),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             const QuantitySuggestedHeader(
                  title: "Colon and Rectal Surgery", subTitle: "OxyCodone 5mg"),
            const  QuantitySuggestedRow(
                title: "Colectomy-Laparoscopic",
                subTitle: "0-10",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Colectomy-Open",
                subTitle: "0-15",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedRow(
                title: "Ileostomy/Colostomy Creation, Re-siting, or Closure",
                subTitle: "0-15",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Small Bowel Resection or Enterolysis - Open",
                subTitle: "0-15",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedHeader(
                  title: "Dentistry", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Dental Extraction",
                subTitle: "0",
                color: Colors.white,
              ),
             const  QuantitySuggestedHeader(
                  title: "General Surgery", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Anti-reflux (Nissen) - Laparoscopic",
                subTitle: "0-10",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Appendectomy – Laparoscopic or Open",
                subTitle: "0-10",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedRow(
                title: "Cholecystectomy - Laparoscopic",
                subTitle: "0-10",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Cholecystectomy - Open",
                subTitle: "0-15",
                color: Colors.blue[50] ?? Colors.blue,
              ),
              const QuantitySuggestedRow(
                title: "Donor Nephrectomy - Laparoscopic",
                subTitle: "0-10",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Hernia Repair – Minor or Major",
                subTitle: "0-10",
                color: Colors.blue[50] ?? Colors.blue,
              ),
              const QuantitySuggestedRow(
                title: "Sleeve Gastrectomy",
                subTitle: "0-10",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Thyroidectomy",
                subTitle: "0-10",
                color: Colors.blue[50] ?? Colors.blue,
              ),
              const QuantitySuggestedHeader(
                  title: "Surgical Oncology", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Breast Biopsy or Lumpectomy",
                subTitle: "0-5",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Lumpectomy + Sentinel Lymph Node Biopsy",
                subTitle: "0-5",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedRow(
                title: "Sentinel Lymph Node Biopsy Only",
                subTitle: "0-5",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Wide Local Excision ± Sentinel Lymph Node Biopsy",
                subTitle: "0-20",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedRow(
                title: "Simple Mastectomy ± Sentinel Lymph Node Biopsy",
                subTitle: "0-20",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title:
                    "Modified Radical Mastectomy or Axillary Lymph Node Dissection",
                subTitle: "0-30",
                color: Colors.blue[50] ?? Colors.blue,
              ),
             const QuantitySuggestedHeader(
                  title: "Obstetrics and Gynecology",
                  subTitle: "OxyCodone 5mg"),
            const  QuantitySuggestedRow(
                title: "Cesarean",
                subTitle: "0-20",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Hysterectomy – Abdominal",
                subTitle: "0-20",
                color: Colors.blue[50] ?? Colors.blue,
              ),
            const  QuantitySuggestedRow(
                title: "Hysterectomy – Laparoscopic or Vaginal",
                subTitle: "0-15",
                color: Colors.white,
              ),
            const  QuantitySuggestedHeader(
                  title: "Orthopaedic Surgery", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Total Hip Arthroplasty",
                subTitle: "0-30",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Total Knee Arthroplasty",
                subTitle: "0-50",
                color: Colors.blue[50] ?? Colors.blue,
              ),
            const  QuantitySuggestedHeader(
                  title: "Thoracic Surgery", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Cardiac Surgery via Median Sternotomy",
                subTitle: "0-25",
                color: Colors.white,
              ),
              const QuantitySuggestedHeader(
                  title: "Urology", subTitle: "OxyCodone 5mg"),
                const  QuantitySuggestedRow(
                title: "Prostatectomy",
                subTitle: "0-10",
                color: Colors.white,
              ),
            const  QuantitySuggestedHeader(
                  title: "Vascular Surgery", subTitle: "OxyCodone 5mg"),
               const   QuantitySuggestedRow(
                title: "Carotid Endarterectomy",
                subTitle: "0-10",
                color: Colors.white,
              ),
              const QuantitySuggestedHeader(
                  title: "Pediatric Surgery (Patients under 18 years of age)", subTitle: "OxyCodone 5mg"),
             const QuantitySuggestedRow(
                title: "Adenoidectomy",
                subTitle: "0",
                color: Colors.white,
              ),
               QuantitySuggestedRow(
                title: "Appendectomy",
                subTitle: "0",
                color: Colors.blue[50] ?? Colors.blue,
              ),
              const QuantitySuggestedRow(
                title: "Dental Extraction",
                subTitle: "0",
                color: Colors.white,
              ),
              QuantitySuggestedRow(
                title: "Inguinal Hernia",
                subTitle: "0",
                color: Colors.blue[50] ?? Colors.blue,
              ),
              const QuantitySuggestedRow(
                title: "Umbilical Hernia",
                subTitle: "0",
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
