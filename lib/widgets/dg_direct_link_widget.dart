import 'package:flutter/material.dart';

import '../dg_direct_link.dart';
import '../models/dg_direct_link_model.dart';

class DGDirectLinkWidget extends StatefulWidget {
  final String url;
  final bool debugMode;
  final Widget Function() loading;
  final Widget Function() error;
  final Widget Function(List<DGDirectLinkModel> links) complete;
  const DGDirectLinkWidget({
    this.debugMode = true,
    required this.url,
    required this.loading,
    required this.error,
    required this.complete,
    super.key});

  @override
  State<DGDirectLinkWidget> createState() => _DGDirectLinkWidgetState();


}

class _DGDirectLinkWidgetState extends State<DGDirectLinkWidget> {
  

  @override
  Widget build(BuildContext context) {
    
    return  FutureBuilder<List<DGDirectLinkModel>>(
                future: DGDirectLink.get(url: widget.url,debugMode: widget.debugMode),
                builder: (context,state) {
                
                  if(state.data == null){
                    return widget.loading();
                  }
                  if(state.data!.isEmpty){
                    return widget.error();
                  }
                  if(state.hasData){
                    return widget.complete(state.data!);
                  }
                
                   return widget.error();
                 
                  
                }
              );
    
    
  }
}