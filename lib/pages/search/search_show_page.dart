import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/back_floating_action_button.dart';
import 'package:tv_maze/generic_widgets/expanded_show_grid_view.dart';
import 'package:tv_maze/utils/constants.dart';

///Page where you can search for a show
class SearchShowPage extends StatefulWidget {
  ///Constructor
  const SearchShowPage({Key? key}) : super(key: key);
  ///Route name for this page
  static const routeName = Constants.searchShowPageRouteName;
  @override
  _SearchShowPageState createState() => _SearchShowPageState();
}

class _SearchShowPageState extends State<SearchShowPage> {
  final inputController = TextEditingController();

  _onChanged(String text) {
    context.read<ShowBloc>().add(LoadShowSearchDataEvent(query: text));
  }

  void backButtonAction(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<ShowBloc>().add(LoadShowDataEvent());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search show'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: inputController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Show name..',
              hintStyle: const TextStyle(color: Colors.grey),
              labelText: 'Search show by name',
              suffixIcon: const Icon(Icons.search_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: (text) {
              _onChanged(text);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<ShowBloc, ShowState>(
            builder: (context, state) {
              if (state is ShowInitialState) {
                return const CircularProgressIndicator();
              } else if (state is ShowLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is ShowListLoadedState) {
                return ExpandedShowsGridView(
                  showList: state.showList,
                );
              } else if (state is ShowErrorState) {
                return const Text(Constants.blocErrorText);
              }

              return const Text(Constants.blocErrorWhileLoadingText + 'Shows!');
            },
          )
        ],
      ),
      floatingActionButton: BackFloatingActionButton(action: backButtonAction),
    );
  }
}
