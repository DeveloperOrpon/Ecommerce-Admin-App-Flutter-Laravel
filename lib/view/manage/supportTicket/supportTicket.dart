import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/SupportTicketRes.dart';
import 'package:ashique_admin_app/view/manage/supportTicket/supportReplies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/refresh.dart';
import '../../../controller/supportController.dart';

class SupportTicket extends StatelessWidget {
  static const String routeName = 'SupportTicket';

  const SupportTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final supportController = Get.put(SupportController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          'All Tickets',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: true,
        header: refreshLoading(context),
        footer: customFooter,
        controller: supportController.refreshController,
        onRefresh: supportController.onRefresh,
        onLoading: supportController.onLoading,
        child: Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: supportController.allSupportTickets.value.length,
              itemBuilder: (context, index) => _supportTicketTile(context,supportController.allSupportTickets.value[index]),
            );
          }
        ),
      ),
    );
  }

  _supportTicketTile(BuildContext context, SupportTicketModel ticketModel) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    Future.delayed(
      Duration(seconds: 1),
      () {
        tooltipkey.currentState?.ensureTooltipVisible();
      },
    );
    return Stack(
      children: [
        Container(
          height: 165,
          // padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade400,
                width: .6,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10),
                child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "#${ticketModel.id} ",
                        style: GoogleFonts.robotoMono(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "${ticketModel.subject}",
                        style: GoogleFonts.roboto(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "${ticketModel.description}",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "UserName: ${ticketModel.name}",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "Email: ${ticketModel.email}",
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "${ticketModel.type.toString().capitalize}",
                    style: GoogleFonts.roboto(fontSize: 12,color:Colors.white,),
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Priority\n",
                              style: GoogleFonts.robotoMono(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: "${ticketModel.priority}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ])),
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            // Text("Status: ",
                            //     style: GoogleFonts.robotoMono(
                            //       color: Colors.black45,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 14,
                            //     )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CustomDropdown<String>(
                                  closedHeaderPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                  validator: (p0) {
                                    return p0 == null || p0.isEmpty
                                        ? 'Please Select A Type'
                                        : null;
                                  },
                                  decoration: CustomDropdownDecoration(
                                    closedBorderRadius:
                                        BorderRadius.circular(8),
                                    closedBorder: Border.all(
                                        color: ticketModel.status!.toLowerCase() != 'pending'
                                            ? Colors.green
                                            : Colors.redAccent,
                                        width: .5),
                                    closedErrorBorder: Border.all(
                                        color: Colors.redAccent, width: .2),
                                  ),
                                  hintText: 'Select A Type',
                                  items: const ['Open', 'Close'],
                                  initialItem:
                                  ticketModel.status!.toLowerCase() != 'pending' ? "Open" : "Close",
                                  onChanged: (value) async {
                                    final supportController = Get.put(SupportController());
                                    startLoading();
                                    await supportController.updateStatus(status: value.toLowerCase(), id: ticketModel.id.toString()).then((value) {
                                      Get.back();
                                    }).catchError((onError) {
                                      // Get.back();
                                      showErrorToast('Warning',
                                          'Ticket Update Error Try Again', context);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Tooltip(
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                          key: tooltipkey,
                          message: "All Replies Here",
                          preferBelow: true,
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor),
                          child: InkWell(
                            onTap: () {
                              Get.to(SupportReplies(supportTicketModel: ticketModel),
                                  transition: Transition.fadeIn);
                            },
                            child: Icon(
                              CupertinoIcons.conversation_bubble,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 15,
          top: 5,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              "Last at ${DateFormat('MM/dd/yyyy hh:mm a').format(
                DateTime.now(),
              )}",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontStyle: FontStyle.italic),
            ),
          ),
        )
      ],
    );
  }
}
