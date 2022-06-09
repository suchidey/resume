AllEducation allEducation = AllEducation();

class AllEducation {
  all() {
    Education header = Education(id: 0, university: "University", degree: "Degree", duration: "Duration");
    Education mba = Education(id: 1, university: "NATIONAL UNIVERSITY OF SINGAPORE", degree: "Masters in Business\nAdministration (MBA)", duration: "Aug 2015 - Dec 2016");
    Education btech = Education(id: 2, university: "BIRLA INSTITUTE OF TECHNOLOGY", degree: "Bachelors in engineering (B.Tech)", duration: "May 2007 - Jun 2011");
    return [header, mba, btech];
  }
}

class Education {
  Education({required this.id, required this.university, required this.degree, required this.duration});

  final String university;
  final String degree;
  final String duration;
  final int id;
}
