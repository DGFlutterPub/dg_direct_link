import 'package:flutter/material.dart';

import '../dg_direct_link.dart';
import '../models/dg_direct_link_model.dart';

class DGDirectLinkWidget extends StatelessWidget {
  final String url;
  final Widget Function() loading;
  final Widget Function() error;
  final Widget Function(List<DGDirectLinkModel> links) complete;
  const DGDirectLinkWidget({
    required this.url,
    required this.loading,
    required this.error,
    required this.complete,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<DGDirectLinkModel>>(
              future: DGDirectLink.start(url: url),
              builder: (context,state) {
                if(state.data == null){
                  return loading();
                }
                if(state.hasError){
                  return error();
                }
                if(state.hasData){
                   return complete(state.data!);
                }
                return error();
              }
            );
  }
}