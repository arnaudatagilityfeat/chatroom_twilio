import 'package:chatroom_twilio/conference/conference_cubit.dart';
import 'package:chatroom_twilio/conference/conference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatroom_twilio/room/join_room_cubit.dart';
import 'package:chatroom_twilio/shared/twilio_service.dart';

class JoinRoomPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                RoomCubit(backendService: TwilioFunctionsService.instance),
            child: BlocConsumer<RoomCubit, RoomState>(
                listener: (context, state) async {
            }, builder: (context, state) {
              var isLoading = false;
              RoomCubit bloc = context.read<RoomCubit>();
              if (state is RoomLoading) {
                isLoading = true;
              }
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              key: Key('enter-name'),
                              decoration: InputDecoration(
                                labelText: 'Enter your name',
                                enabled: !isLoading,
                              ),
                              controller: _nameController,
                              onChanged: (newValue) =>
                                  context.read<RoomCubit>().name = newValue,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            (isLoading == true)
                                ? LinearProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () async {
                                      await bloc.submit();
                                    },
                                    child: Text('Enter the room')),
                            (state is RoomError)
                                ? Text(
                                    state.error,
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ]),
              );
            }),
          ),
        ),
      ),
    );
  }
}
