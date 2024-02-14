import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // phone_login
  {
    'rdbgbdmh': {
      'en': 'Bienvenue !',
      'fr': 'Bienvenue !',
    },
    'n29lmgqi': {
      'en': 'Numéro de Téléphone',
      'fr': 'Numéro de Téléphone',
    },
    'xi8pf2o7': {
      'en': 'Suivant',
      'fr': 'Suivant',
    },
    'glroyz5w': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Home
  {
    'uzmzwxww': {
      'en': 'Nos catégories',
      'fr': 'Nos catégories',
    },
    '250co72k': {
      'en': 'Voir plus',
      'fr': 'Voir plus',
    },
    'mwnwepot': {
      'en': 'Voir plus',
      'fr': 'Voir plus',
    },
    '083677tk': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    'z5fmkkk2': {
      'en': '/',
      'fr': '/',
    },
    'tmsz1074': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // login_otp
  {
    'bkmy24tv': {
      'en': 'Entrez le code OTP',
      'fr': 'Entrez le code OTP',
    },
    'd13qosm8': {
      'en': 'Renvoyer le code',
      'fr': 'Renvoyer le code',
    },
    'g62hca8n': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // categories
  {
    'cgk77f9b': {
      'en': 'Nos catégories',
      'fr': 'Nos catégories',
    },
    'qe4wxpk0': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // detail_categori
  {
    '1to0fr2k': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    'uaz55xuw': {
      'en': '/',
      'fr': '/',
    },
    '173wp4hw': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // menu
  {
    'o0i4krrm': {
      'en': 'Menu',
      'fr': 'Menu',
    },
    'ttmkvxki': {
      'en': 'GAGNE 10 000 CFA en ',
      'fr': 'GAGNE 10 000 CFA en',
    },
    'rv9c5dqh': {
      'en': 'recommendant un restaurant',
      'fr': 'recommander un restaurant',
    },
    '5iar4uyd': {
      'en': 'Clique ici pour découvrir la marche à suivre.',
      'fr': 'Cliquez ici pour découvrir la marche à suivre.',
    },
    'uq1vdyla': {
      'en': 'Mon profil',
      'fr': 'Mon profil',
    },
    'm7wrwtuq': {
      'en': 'Configure ton compte',
      'fr': 'Configurer votre compte',
    },
    '5ewrzqt6': {
      'en': 'Support',
      'fr': 'Soutien',
    },
    'r877qn44': {
      'en': 'Déconnexion',
      'fr': 'Déconnexion',
    },
    'ggqes1x3': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // produit
  {
    '2slbqdo0': {
      'en': 'Reporter Prix Elevés',
      'fr': 'Reporter Prix Élevés',
    },
    '0v7fp18q': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    '34wwn0m7': {
      'en': ' à l’unité',
      'fr': 'à l\'unité',
    },
    '4qg4tqzv': {
      'en': 'Total :',
      'fr': 'Total :',
    },
    '7yh6alt6': {
      'en': 'CFA',
      'fr': 'CFA',
    },
    'yv2r78yx': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    'mgijil1g': {
      'en': ' à l’unité',
      'fr': 'à l\'unité',
    },
    'a46c3njm': {
      'en': 'Total :',
      'fr': 'Total :',
    },
    'r6ujjhop': {
      'en': 'CFA',
      'fr': 'CFA',
    },
    '1itlzc2q': {
      'en': 'Tu pourrais aussi aimer...',
      'fr': 'Tu pourrais aussi aimer...',
    },
    'y3wjy2ey': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    '1l1o8gst': {
      'en': '/',
      'fr': '/',
    },
    'qawc0fcj': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // panier
  {
    'tkywwe4v': {
      'en': 'Mon Panier',
      'fr': 'Mon Panier',
    },
    'w5vxx0pl': {
      'en': 'supprimer',
      'fr': 'supprimer',
    },
    '3t7ownux': {
      'en': 'Vider le panier',
      'fr': 'Vider le panier',
    },
    'pobu6zcz': {
      'en': 'Tu souhaites ajouter quelque chose? ',
      'fr': 'Tu souhaites ajouter quelque chose?',
    },
    '9y25crgo': {
      'en': 'CFA ',
      'fr': 'CFA',
    },
    'ohmnwuzt': {
      'en': '/',
      'fr': '/',
    },
    '6z3g5vc8': {
      'en': 'Panier vide',
      'fr': 'Panier vide',
    },
    '5tg1yu8d': {
      'en':
          'Il semble que votre panier soit vide, veuillez ajouter des articles à votre panier pour pouvoir passer à la caisse.',
      'fr':
          'Il semble que votre panier soit vide, veuillez ajouter des articles à votre panier pour pouvoir passer à la caisse.',
    },
    'hds1j9fe': {
      'en': 'Détails',
      'fr': 'Détails',
    },
    'nbbwy6ff': {
      'en': 'Coût de livraison : ',
      'fr': 'Coût de livraison :',
    },
    'onxxvt7j': {
      'en': 'CFA  0.00',
      'fr': '0,00 FCFA',
    },
    'vf90jhzy': {
      'en': 'Total : ',
      'fr': 'Total :',
    },
    'ikfs76hi': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // programmationcommande
  {
    'ua3ja2zp': {
      'en': 'Programme ta commande',
      'fr': 'Programme à commander',
    },
    '144vmrsl': {
      'en': 'Adresse de livraison :',
      'fr': 'Adresse de livraison :',
    },
    'vyo0t1wx': {
      'en': 'Ajoutez s\'il vous plaît un\nrestaurant pour la livraison.',
      'fr': 'Ajoutez s\'il vous plaît un\nrestaurant pour la livraison.',
    },
    'u8r2icdr': {
      'en': 'Ajouter un restaurant',
      'fr': 'Ajouter un restaurant',
    },
    '6kdqwao9': {
      'en': 'Changer d’addresse',
      'fr': 'Changer d’addresse',
    },
    '9y6foq61': {
      'en': 'Date & Heure de livraison :',
      'fr': 'Date et heure de livraison :',
    },
    '4zj15eru': {
      'en': '06:00h  -  08:00h',
      'fr': '06:00h  -  08:00h',
    },
    '4sk7y094': {
      'en': '08:00h  -  10:00h',
      'fr': '08:00h  -  10:00h',
    },
    '13jhml0n': {
      'en': '10:00h  -  12:00h',
      'fr': '10:00h  -  12:00h',
    },
    'xbs08yiy': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // confirmerlocalisation
  {
    'aqt3xatv': {
      'en': 'Confirmez votre localisation',
      'fr': 'Confirmez votre localisation',
    },
    '4boebu0j': {
      'en': 'Adresse',
      'fr': 'Adresse',
    },
    'kund7sjn': {
      'en': 'description précise',
      'fr': 'description précise',
    },
    'tclq848x': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // resume
  {
    '8nfks1nt': {
      'en': 'Resumé',
      'fr': 'CV',
    },
    'l14yvns7': {
      'en': 'Liste des produits',
      'fr': 'Liste des produits',
    },
    'p7voplhb': {
      'en': 'Prix Total',
      'fr': 'Prix ​​Total',
    },
    'my387psr': {
      'en': 'Resumé de la commande',
      'fr': 'CV de la commande',
    },
    '8tmf5s6j': {
      'en': 'Sous Total',
      'fr': 'Sous Total',
    },
    'gotgpe2v': {
      'en': 'Reductions',
      'fr': 'Réductions',
    },
    'z3qny8w4': {
      'en': '- CFA 0.00',
      'fr': '- 0,00 FCFA',
    },
    'iwza5ui1': {
      'en': 'Frais de livraison',
      'fr': 'Frais de livraison',
    },
    '0owmxmeh': {
      'en': 'CFA  0.00',
      'fr': '0,00 FCFA',
    },
    'o53sp8gb': {
      'en': 'Prix Total',
      'fr': 'Prix ​​Total',
    },
    'u30rn8hq': {
      'en': 'Date & Heure de livraison',
      'fr': 'Date et heure de livraison',
    },
    '9fjdr4s2': {
      'en': 'Date de livraison',
      'fr': 'Date de livraison',
    },
    'mpo1plvl': {
      'en': 'Jeudi 17 Janvier',
      'fr': 'Jeudi 17 Janvier',
    },
    'p2qdgsqn': {
      'en': 'Horaire de livraison',
      'fr': 'Horaire de livraison',
    },
    'psw5wgta': {
      'en': 'De 06:00h à 08:00h',
      'fr': 'De 06h00 à 08h00',
    },
    'mapi58vh': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // paiement
  {
    'jcyl188z': {
      'en': 'Paiement',
      'fr': 'Paiement',
    },
    'hp3eyrsp': {
      'en': 'Moyens de Paiement',
      'fr': 'Moyens de Paiement',
    },
    'dn69xi3l': {
      'en': 'Cash',
      'fr': 'Espèces',
    },
    'qtd351ua': {
      'en': 'Paiement au moment de la livraison',
      'fr': 'Paiement au moment de la livraison',
    },
    'mg6grzp4': {
      'en': 'Mobile money',
      'fr': 'Argent mobile',
    },
    'zappe0d9': {
      'en': 'Payez en sécurité avec Moov, MTN, Orange Money.',
      'fr': 'Payez en sécurité avec Moov, MTN, Orange Money.',
    },
    '50lxw6is': {
      'en': 'Carte de Crédit',
      'fr': 'Carte de Crédit',
    },
    'mbhmb09m': {
      'en': 'Plateforme de paiement sécurisée',
      'fr': 'Plateforme de paiement sécurisée',
    },
    'vk3ao462': {
      'en': 'En procèdant au paiement, vous acceptez nos',
      'fr': 'En procédant au paiement, vous acceptez nos',
    },
    'kv0okcu9': {
      'en': 'Termes et Conditions',
      'fr': 'Termes et Conditions',
    },
    'uiayjilw': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // searchform
  {
    'ffefc2s2': {
      'en': 'De quoi avez vous besoin aujourd’hui ?',
      'fr': 'De quoi avez-vous besoin aujourd’hui ?',
    },
  },
  // navbar
  {
    'lo6a6inm': {
      'en': 'Accueil',
      'fr': 'Accueil',
    },
    'c7ytmad6': {
      'en': 'Catégories',
      'fr': 'Catégories',
    },
    '4ab7sysw': {
      'en': 'Commandes',
      'fr': 'Commandes',
    },
    'qsq663qf': {
      'en': 'Menu',
      'fr': 'Menu',
    },
  },
  // create_restaurant
  {
    'w739lpwn': {
      'en': 'Créer un Restaurant',
      'fr': 'Créer un restaurant',
    },
    'sofwuq4n': {
      'en': 'Veuillez créer un restaurant pour vous faire livrer.',
      'fr': 'Veuillez créer un restaurant pour vous faire livrer.',
    },
    'mxrcc3t2': {
      'en': 'Ajoutez le logo',
      'fr': 'Ajouter le logo',
    },
    'veu9ezyu': {
      'en': 'de votre restaurant...',
      'fr': 'de votre restaurant...',
    },
    '9w6ktuu9': {
      'en': 'Nom du restaurant',
      'fr': 'Nom du restaurant',
    },
    'd9e4gfz4': {
      'en': 'Ville',
      'fr': 'Ville',
    },
    'z6ih4qn5': {
      'en': 'Quartier',
      'fr': 'Quartier',
    },
    'cx1u1k9n': {
      'en': 'Description sommaire',
      'fr': 'Description sommaire',
    },
    '67eecpk7': {
      'en': 'Ajouter un restaurant',
      'fr': 'Ajouter un restaurant',
    },
    '46azb3gq': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'drk819zs': {
      'en': 'Please enter a real name',
      'fr': 'Veuillez entrer un vrai nom',
    },
    'b4hmrrd3': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'j6lhobuc': {
      'en': 'Please enter a short desription',
      'fr': 'Veuillez saisir une courte description',
    },
    'xql1qj5i': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ac70l4z6': {
      'en': 'We have to have a URL for the project.',
      'fr': 'Nous devons avoir une URL pour le projet.',
    },
    'p4sawwyp': {
      'en': 'Please enter a valid URL...',
      'fr': 'Veuillez saisir une URL valide...',
    },
    'o2cqik96': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'gjto3x65': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'xhb98kw3': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // Miscellaneous
  {
    'pvdpl97d': {
      'en': '',
      'fr': '',
    },
    '3maff1wy': {
      'en': '',
      'fr': '',
    },
    'a3u0j6cf': {
      'en': '',
      'fr': '',
    },
    'vrieipwe': {
      'en': '',
      'fr': '',
    },
    'cqi0pchf': {
      'en': '',
      'fr': '',
    },
    '6eue3veu': {
      'en': '',
      'fr': '',
    },
    'p580ifbv': {
      'en': '',
      'fr': '',
    },
    'ess2o9sx': {
      'en': '',
      'fr': '',
    },
    'm15zyvjm': {
      'en': '',
      'fr': '',
    },
    'fvc6ezih': {
      'en': '',
      'fr': '',
    },
    'yynpkvca': {
      'en': '',
      'fr': '',
    },
    'zxdrbqbv': {
      'en': '',
      'fr': '',
    },
    '0p3cidud': {
      'en': '',
      'fr': '',
    },
    'v17yc0jw': {
      'en': '',
      'fr': '',
    },
    'i9gxg367': {
      'en': '',
      'fr': '',
    },
    'ij2ce5a1': {
      'en': '',
      'fr': '',
    },
    'pvtfot3c': {
      'en': '',
      'fr': '',
    },
    '96am06ys': {
      'en': '',
      'fr': '',
    },
    '5s934u0d': {
      'en': '',
      'fr': '',
    },
    'kzmu82tk': {
      'en': '',
      'fr': '',
    },
    '8bepovc6': {
      'en': '',
      'fr': '',
    },
    'm8b75o3c': {
      'en': '',
      'fr': '',
    },
    'bc94j01c': {
      'en': '',
      'fr': '',
    },
    'nnaojy1e': {
      'en': '',
      'fr': '',
    },
    'jobnfuvr': {
      'en': '',
      'fr': '',
    },
    '11j538kq': {
      'en': '',
      'fr': '',
    },
    '87a56m94': {
      'en': '',
      'fr': '',
    },
    'g2dblrgu': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
