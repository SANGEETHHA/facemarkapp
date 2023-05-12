import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/manual_update_controller.dart';
import 'models/manual_update_model.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';

class ManualUpdatePage extends StatefulWidget {
 ManualUpdateController controller = Get.put(ManualUpdateController(ManualUpdateModel().obs));

  @override
  _ManualUpdatePageState createState() => _ManualUpdatePageState();
}

class _ManualUpdatePageState extends State<ManualUpdatePage> {
  bool status = false; // Added boolean variable for status
  final TextEditingController studentController = TextEditingController();
  late String _selectedBranch="";
  late String _selectedSection="";
  late String _selectedSubject="";
  late DateTime _selectedDate=DateTime.now();

  List<String> branches = [];
  List<String> sections = [];
  List<String> subjects = [];

  Future<List<String>> fetchBranches() async {
    final response = await http.get(Uri.parse('http://facemark.me/api/branch/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> branches = [];
      for(var i=0; i<data.length; i++)
      {
        branches.add(data[i]["branchName"]);
      }
      return branches;
    } else {
      throw Exception('Failed to fetch branches');
    }
  }


  Future<List<String>> fetchSubjects() async {
    final response = await http.get(Uri.parse('http://facemark.me/api/subject/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> subjects = [];
      for(var i=0; i<data.length; i++)
      {
        subjects.add(data[i]["subjectName"]);
      }
      return subjects;
    } else {
      throw Exception('Failed to fetch subjects');
    }
  }

  Future<List<String>> fetchSections() async {
    final response = await http.get(Uri.parse('http://facemark.me/api/section/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> sections = [];
      for(var i=0; i<data.length; i++)
      {
        sections.add(data[i]["sectionName"]);
      }
      return sections;
    } else {
      throw Exception('Failed to fetch sections');
    }
  }


  void _onBranchSelected(String? branch) {
    setState(() {
      print("Point-1");
      _selectedBranch = branch!;
      print(_selectedBranch);
    });
  }

  void _onSectionSelected(String? section) {
    setState(() {
      _selectedSection = section!;
    });
  }

  void _onSubjectSelected(String? subject) {
    setState(() {
      _selectedSubject = subject!;
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void initState() {
    print("INIT CALLLED");
    super.initState();
    fetchBranches().then((data) {
      print("-----------------------------");
      print(data);
      setState(() {
        branches = data;
      });
      print("Point-2");
      _selectedBranch=data[0];
    }).catchError((error) {
      print('Error fetching branches: $error');
    });

    fetchSections().then((data) {
      setState(() {
        sections = data;
      });
      _selectedSection=data[0];
    }).catchError((error) {
      print('Error fetching sections: $error');
    });

    fetchSubjects().then((data) {
      setState(() {
        subjects = data;
      });
      _selectedSubject=data[0];
    }).catchError((error) {
      print('Error fetching subjects: $error');
    });
  }
  Future<void> updateAttendance() async {
    final id = '<id>'; // Replace <id> with the actual ID from the API URL
    final url = 'http://facemark.me/api/attendance/$id';

    final data = {
      'status': status.toString(), // Convert boolean status to string
      'student': studentController.text.trim(),
      'branch':_selectedBranch,
      'section':_selectedSection,
      'subject':_selectedSubject,
      'date':_selectedDate,
    };

    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Attendance updated successfully
      print("Attendance updated successfully");
    } else {
      // Attendance update failed
      // Handle the error or show an error message
    }
  }
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
            child:Form(
            key: _formKey,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      decoration: AppDecoration.fillTeal300,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgImage2839x389,
                              height: getVerticalSize(850),
                              width: getHorizontalSize(400),
                              alignment: Alignment.center),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: getPadding(
                                  left: 19, top:35, right: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                      height: 39,
                                      width: 39,
                                      margin: getMargin(left: 1),
                                      onTap: () {
                                        onTapBtnArrowleft();
                                      },
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowleftBlack90001)),
                                  Padding(
                                      padding: getPadding(top: 26),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                "lbl_manual".tr,
                                                style: TextStyle(
                                                    color: ColorConstant.black90001,
                                                    fontSize: getFontSize(30),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: getHorizontalSize(0.28),)),
                                            TextSpan(
                                                text: " ",
                                                style: TextStyle(
                                                    color: ColorConstant.indigo900,
                                                    fontSize: getFontSize(30),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: getHorizontalSize(0.28))),
                                            TextSpan(
                                                text: "lbl_update".tr,
                                                style: TextStyle(
                                                    color: ColorConstant.whiteA700,
                                                    fontSize: getFontSize(30),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: getHorizontalSize(0.28)))
                                          ]),
                                          textAlign: TextAlign.center)),
                          // Your UI elements here

                          Container(
                            child:Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextField(
                                      controller: studentController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter student USN or Name',
                                        hintStyle: TextStyle(fontSize: 14.0), // Set the desired font size
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                              SizedBox(
                                height: 50.0, // Set the desired height
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: DropdownButton<String>(
                                    value: _selectedBranch,
                                    hint: Text('Select Branch'),
                                    onChanged: _onBranchSelected,
                                    underline: Container(), // Remove the underline
                                    items: branches.map((branch) => DropdownMenuItem(
                                      value: branch,
                                      child: Text(
                                        branch,
                                        style: TextStyle(fontSize: 14.5),
                                      ),
                                    )).toList(),
                                  ),
                                )),
                                SizedBox(height: 10),

                                SizedBox(
                                  height: 50.0, // Set the desired height
                                  child: Container(
                                    decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    // border: Border.all(width: 1.0, color: Colors.grey),
                                  ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: Colors.white,
                                      ),
                                      child: DropdownButton<String>(
                                        value: _selectedSubject,
                                        hint: Text('Select Subject'),
                                        onChanged: _onSubjectSelected,
                                        underline: Container(),
                                        items: subjects.map((subject) => DropdownMenuItem(
                                          value: subject,
                                          child: Text(
                                            subject,
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        )).toList(),
                                      ),
                                    ),
                                  ),),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 50.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              canvasColor: Colors.white,
                                            ),
                                            child: DropdownButton<String>(
                                              value: _selectedSection,
                                              hint: Text('Select Section'),
                                              onChanged: _onSectionSelected,
                                              underline: Container(),
                                              items: sections.map((section) => DropdownMenuItem(
                                                value: section,
                                                child: Text(
                                                  section,
                                                  style: TextStyle(fontSize: 16.0),
                                                ),
                                              )).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10), // Add spacing between the containers
                                    Expanded(
                                      child: SizedBox(
                                        height: 50.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: status,
                                                onChanged: (value) {
                                                  setState(() {
                                                    status = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Status',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                              SizedBox(
                                height: 50.0, // Set the desired height
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime? date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    );
                                    if (date != null) {
                                      _onDateSelected(date);
                                    }
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      // border: Border.all(width: 1.0, color: Colors.grey),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _selectedDate.toString().substring(0, 10),
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Icon(Icons.calendar_today),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: updateAttendance,
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Update Attendance',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),],
                      ),),),],),),),],),),
    ),),),),);
  }

  onTapBtnArrowleft() {
    Get.back();
  }

}

