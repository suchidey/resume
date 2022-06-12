AllWork allWork = AllWork();

class Work {
  Work({required this.id, required this.name, required this.task, required this.list, required this.images, required this.app, required this.url});

  final String name;
  final String task;
  final String url;
  final List<String> list;
  final List<String> images;
  final List<App> app;
  final int id;
}

class App {
  App(
      {required this.id,
      required this.name,
      required this.image,
      required this.url,
      required this.androidUrl,
      required this.iosUrl,
      required this.googleplay,
      required this.appstore});

  final String name;
  final String image;
  final String url;
  final String androidUrl;
  final String iosUrl;
  final String appstore;
  final String googleplay;

  final int id;
}

class AllWork {
  List<Work> all() {
    Work w0 = Work(id: 0, name: work0, task: task0, list: list0, images: images0, app: app0, url: url0);
    Work w1 = Work(id: 1, name: work1, task: task1, list: list1, images: images1, app: app1, url: url1);
    Work w2 = Work(id: 2, name: work2, task: task2, list: list2, images: images2, app: app2, url: url2);
    Work w3 = Work(id: 3, name: work3, task: task3, list: list3, images: images3, app: app3, url: url3);
    Work w4 = Work(id: 4, name: work4, task: task4, list: list4, images: images4, app: app4, url: url4);
    Work w5 = Work(id: 5, name: work5, task: task5, list: list5, images: images5, app: app5, url: url5);
    return [w0, w1, w2, w3, w4, w5];
  }

  String get url0 => "https://en.zalando.de/?_rfl=de";
  String get url1 => "https://www.scout24.com/en/";
  String get url2 => "https://www.docdoc.com/";
  String get url3 => "https://www.m-brain.com/";
  String get url4 => "https://www.linkedin.com/company/ks-apparel";
  String get url5 => "https://www2.deloitte.com/in/en.html";

  String get work0 => "ZALANDO SE\n(Berlin) Jan 2022 - Present";
  String get work1 => "SCOUT24 AG\n(Berlin) Jan 2021 - Dec 2021";
  String get work2 => "DOCDOC PTE LTD\n(Singapore) Oct 2018 - Jul 2020";
  String get work3 => "M-BRAIN GROUP\n(Singapore) Feb 2017 - Sept 2018";
  String get work4 => "KS APPAREL\n(Calcutta) Aug 2014 - Jul 2015";
  String get work5 => "DELOITTE CONSULTING LLP\n(Hyderabad) Jun 2011 - Aug 2014";

  String get task0 => "Shaping the data strategy for Zalando group, taking a central role in conception and implementation of scalable data products across 500+ teams";
  String get task1 => "Driving the vision for Scout24's data platform including tools for data storage, transformation, orchestration & BI";
  String get task2 => "Solely managed the core product 'doctor discovery' (B2B2C) from ideation through launch growing 1M+ users";
  String get task3 => "Delivered key strategy projects as the lead PM; scoping planning, execution, team & stakeholder management";
  String get task4 => "Launched an apparel brand CARVE; turned it cash positive in 1.5 years";
  String get task5 => "Used scrum best practices to help team of 200+ to increase their velocity by 2x";

  List<String> get list0 => [
        "• Leading a global, cross-departmental project to provide a compliant, system-agnostic, scalable data access provisioning infrastructure impacting 5k internal users",
        "• Managing a team of 3 data product managers to deliver components of the large scale data platform",
        "• Key contributor and advocate to the evolution of principles and best-practice for data management, governance, architecture, quality"
      ];

  List<String> get list1 => [
        "• Leading a complex, high-stakes project to provide a 100% GDPR compliant data infrastructure, saving USD 20M to the company in compliance costs",
        "• Guiding a team of 10 engineers including senior data & BI experts to transform the current data platform",
        "• Managing 3 distributed data teams; inculcating a customer-first mindset to steer our platform towards high performance & ease of use",
        "• Mentoring & coaching PMs, junior engineers through regular 1:1s to instill & nurture Scout's core values"
      ];
  List<String> get list2 => [
        "• Mentored new product managers, instilling agile best practices, streamlining processes during PDLC",
        "• Ensured robust prototyping, maximising sprint success to 100%",
        "• Establishing robust metrics to assess product progress; improving adoption and engagement KPIs"
      ];
  List<String> get list3 => [
        "• Served high-stakes clients with deep market research projects such as NPS studies, market sizing/entry projects",
        "• Published 10+ strategy research papers on client publication sites"
      ];
  List<String> get list4 => [
        "• Partnered with fashion retailers-Amazon.in, Flipkart.in; built & facilitated e-commerce sales from ground up",
        "• Managed P&Ls, and led a team of marketing associates",
      ];
  List<String> get list5 => ["• Enabled client CTO desk with data analytics and presentations using SQL and Excel with quick turnaround"];

//images
  List<String> get images0 => ["image/zalando.jpg"];
  List<String> get images1 => ["image/scout24.jpeg"];
  List<String> get images2 => ["image/docdoc.jpg"];
  List<String> get images3 => ["image/mbrain.png"];
  List<String> get images4 => ["image/ksapparel.jpeg"];
  List<String> get images5 => ["image/deloitte.jpg"];

  //app
  List<App> get app0 => [];
  List<App> get app1 => [];
  List<App> get app2 => [];
  List<App> get app3 => [];
  List<App> get app4 => [];
  List<App> get app5 => [];
}
