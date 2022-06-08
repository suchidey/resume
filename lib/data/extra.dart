import 'package:cv/data/work.dart';

AllExtra allExtra = AllExtra();

class AllExtra {
  List<Extra> all() {
    var item01 = Item(id: 0, text: "President, Social Impact club, Student Council NUS MBA (2015).", url: null, app: null, link: null);
    var item02 = Item(id: 0, text: "Women in business award, NUS MBA (2015)", url: null, app: null, link: null);
    var item03 = Item(id: 0, text: "Top Writer, Women studies, QUORA (2015)", url: null, app: null, link: null);
    var item04 = Item(id: 0, text: "Applause award for being a team player, Deloitte (2013).", url: null, app: null, link: null);
    var e1 = Extra(id: 0, title: "LEADERSHIP & AWARDS", section: [item01, item02, item03, item04]);

    var item11 = Item(id: 0, text: "Data PM Nanodegree from Udacity.", url: null, app: null, link: null);
    var item12 = Item(id: 0, text: "ProductTank (05/2019 – 12/2019) talks on topics related to product management to a community of PMs", url: null, app: null, link: null);
    var item13 = Item(id: 0, text: "Annoted (04/2020 – Present) Currently developing an innovative notes app on iOS and Android", url: null, app: null, link: null);
    var e2 = Extra(id: 0, title: "PASSION PROJECTS & CERITIFICATIONS", section: [item11, item12, item13]);

    var item21 = Item(id: 0, text: "Campaign volunteer for girls2pioneer, UN Women (2018).", url: "https://uws.org.sg/girls2pioneers/", app: null, link: null);
    var item22 = Item(id: 0, text: "Mentor for social entrepreneurs, Singapore International foundation (2017).", url: "https://www.sif.org.sg/", app: null, link: null);
    var item23 =
        Item(id: 0, text: "Organized events for MBA cohort on Impact Investment with IIX Asia and Shujog (2016)", url: "https://iixfoundation.org/", app: null, link: null);
    var e3 = Extra(id: 0, title: "VOLUNTEERING", section: [item21, item22, item23]);

    return [e1, e2, e3];
  }
}

class Extra {
  Extra({required this.id, required this.section, required this.title});
  final List<Item> section;
  final String title;
  final int id;
}

class Item {
  Item({required this.id, required this.text, required this.url, required this.app, required this.link});
  final int id;
  final String text;
  final String? url;
  final App? app;
  final String? link;
}
