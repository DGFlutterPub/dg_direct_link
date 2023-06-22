DGHub Studio
============

<a href="https://t.me/dghub_founder" target="_blank"><img src="https://avatars.githubusercontent.com/u/112307287?v=4 | width=100" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

### Buy Me a Coffee
<a href="https://www.paypal.me/dghubfounder" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 37px !important;width: 170px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>



[![Pub](https://img.shields.io/pub/v/font_awesome_flutter.svg)](https://pub.dartlang.org/packages/dg_direct_link)


## Support Sites

- VK
- SolidFiles
- MediaFire
- FEmbed
- GoogleDrive
- Ok.ru
- Dropbox
- Vimeo
- Facebook
- Instagram
- Youtube
- IMDB
- Xnxx



## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  dg_direct_link: <latest_version>
```

## Import package

```dart
import 'package:dg_direct_link/dg_direct_link.dart';
```

## Example Widget

```dart
class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return DGDirectLinkWidget(
       url: 'Paste your link',
       
       loading: (){
        return //Use your loading widget,
       } 
       
       error: (){
        return //Use your error widget,
       } 
       
       complete: (){
        return //User your complete widget,
       } 
    );
  }
}
```
## Example

```dart
DGDirectLink.start('Paste your link').then((links){
  
    }).onError((error, stackTrace) {

    });
```


