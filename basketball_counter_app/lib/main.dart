import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text(
              'Points Counter',
            ),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 30,
              start: 16,
              end: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                            style: TextStyle(
                              fontSize: 150,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'A', buttonNumber: 1);
                            },
                            child: Text(
                              'add 1 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'A', buttonNumber: 2);
                            },
                            child: Text(
                              'add 2 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'A', buttonNumber: 3);
                            },
                            child: Text(
                              'add 3 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 50,
                        endIndent: 50,
                      ),
                    ),
                    Container(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                            style: TextStyle(
                              fontSize: 150,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'B', buttonNumber: 1);
                            },
                            child: Text(
                              'add 1 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'B', buttonNumber: 2);
                            },
                            child: Text(
                              'add 2 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .teamPoints(team: 'B', buttonNumber: 3);
                            },
                            child: Text(
                              'add 3 point',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              minimumSize: Size(150, 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(150, 50),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        //if (state is CounterAIncreamentState) {
        //teamAPoints = BlocProvider.of<CounterCubit>(context).teamAPoints;
        // } else {
        //teamBPoints = BlocProvider.of<CounterCubit>(context).teamBPoints;
        //}
      },
    );
  }
}
