// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "apparTitle":
            MessageLookupByLibrary.simpleMessage("Mars Rovers Photographies"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "dateByPhotos": MessageLookupByLibrary.simpleMessage("Date By Photos"),
        "headerDrewer": MessageLookupByLibrary.simpleMessage("To Mars"),
        "lang": MessageLookupByLibrary.simpleMessage("English"),
        "latestPhotos": MessageLookupByLibrary.simpleMessage("Latest Photos"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "subTitleAppBar": MessageLookupByLibrary.simpleMessage(
            "on this website you can find photos of Rovers on Mars. It uses NASA Apis to  show you all the details about the rovers, including their images . Some dates has not results so try one day before or after ."),
        "theme": MessageLookupByLibrary.simpleMessage("Theme")
      };
}
