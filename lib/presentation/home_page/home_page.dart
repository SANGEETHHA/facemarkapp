import 'package:facemarkapp/presentation/image_preview_page/image_preview_page.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/manual_update_page/manual_update_page.dart';
import 'package:flutter/material.dart';
import 'package:facemarkapp/widgets/app_bar/appbar_image.dart';
import 'package:facemarkapp/widgets/app_bar/custom_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
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


   void _onCaptureAttendancePressed() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    print("Point-3");
    if (pickedFile != null) {
      // Navigate to ImagePreviewPage with the captured image
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImagePreviewPage(
              imagePath: pickedFile.path,
        branch:_selectedBranch,
        section:_selectedSection,
        subject:_selectedSubject,
        date:_selectedDate,
          // usns: ['1VA19IS046','1VA19IS035','1VA19IS040'],
        ))
      );
    }
  }

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.teal300,
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
                     child:Stack(
                     alignment: Alignment.bottomCenter,
                     children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage2,
                          height: getVerticalSize(850),
                          width: getHorizontalSize(400),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: getPadding(top: 10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomAppBar(
                                    height: getVerticalSize(142),
                                    title: Padding(
                                      padding: getPadding(
                                        left: 23,
                                        top: 10,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "lbl_face".tr,
                                              style: TextStyle(
                                                color: ColorConstant.black90001,
                                                fontSize: getFontSize(32),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "lbl_mark".tr,
                                              style: TextStyle(
                                                color: ColorConstant.whiteA700,
                                                fontSize: getFontSize(32),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      AppbarImage(
                                        height: getVerticalSize(96),
                                        width: getHorizontalSize(92),
                                        imagePath: ImageConstant.imgImage1,
                                        margin: getMargin(
                                          left: 25,
                                          right: 25,
                                          bottom: 2,
                                        ),
                                      ),
                                    ],
                                  ),

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
                                    ),),
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

                                  SizedBox(
                                    height: 50.0,
                                    width: 345,// Set the desired height
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


                                  ElevatedButton(
                                    onPressed: (_selectedBranch != null &&
                                        _selectedSection != null &&
                                        _selectedSubject != null &&
                                        _selectedDate != null)
                                        ? _onCaptureAttendancePressed
                                        : null, // Set onPressed to null if any required value is not selected
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Capture Attendance',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),

                                ],),),),

                              ],),),),),
                    ),),);
  }

}

