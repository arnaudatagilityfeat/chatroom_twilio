import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatroom_twilio/conference/conference_cubit.dart';

class ConferencePage extends StatefulWidget {
  const ConferencePage({
    Key? key,
  }) : super(key: key);

  @override
  _ConferencePageState createState() => _ConferencePageState();
}

class _ConferencePageState extends State<ConferencePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<ConferenceCubit, ConferenceState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ConferenceInitial) {
              return showProgress();
            }
            if (state is ConferenceLoaded) {
              return Stack(
                children: <Widget>[
                  _buildParticipants(context),
                  Positioned(
                      bottom: 60,
                      child: IconButton(
                        color: Colors.red,
                        icon: Icon(
                          Icons.call_end_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () async {},
                      ))
                ],
              );
            }
            return Container();
          }),
    );
  }

  Widget showProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 10,
        ),
        Text(
          'Connecting to the room...',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildParticipants(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final children = <Widget>[];
    _buildOverlayLayout(context, size, children);
    return Stack(children: children);
  }

  void _buildOverlayLayout(
      BuildContext context, Size size, List<Widget> children) {
    final conferenceRoom = context.read<ConferenceCubit>();
    final participants = conferenceRoom.participants;
    children.add(GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: participants.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: participants[index],
          );
        }));
  }
}
