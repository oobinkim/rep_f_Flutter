import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/morph_calculator_viewmodel.dart';

class MorphCalculatorView extends StatefulWidget {
  @override
  _MorphCalculatorViewState createState() => _MorphCalculatorViewState();
}

class _MorphCalculatorViewState extends State<MorphCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MorphCalculatorViewModel(),
      child: Consumer<MorphCalculatorViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("레오파드게코 모프 계산기"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "부모 1 모프 검색",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.searchText = value;
                    },
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredMorphs.length,
                      itemBuilder: (context, index) {
                        final morph = viewModel.filteredMorphs[index];
                        return ListTile(
                          title: Text(morph.name),
                          onTap: () {
                            viewModel.selectParent1(morph);
                          },
                        );
                      },
                    ),
                  ),
                  if (viewModel.selectedParent1 != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("선택된 부모 1 모프: ${viewModel.selectedParent1!.name}"),
                    ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "부모 2 모프 검색",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.searchText = value;
                    },
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredMorphs.length,
                      itemBuilder: (context, index) {
                        final morph = viewModel.filteredMorphs[index];
                        return ListTile(
                          title: Text(morph.name),
                          onTap: () {
                            viewModel.selectParent2(morph);
                          },
                        );
                      },
                    ),
                  ),
                  if (viewModel.selectedParent2 != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("선택된 부모 2 모프: ${viewModel.selectedParent2!.name}"),
                    ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.calculateProbability();
                    },
                    child: Text("확률 계산하기"),
                  ),
                  SizedBox(height: 10),
                  if (viewModel.result.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "예상 자손 모프 확률",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 10),
                        ...viewModel.result.entries
                            .map((entry) => Text(
                                "${entry.key}: ${(entry.value * 100).toStringAsFixed(1)}%"))
                            .toList(),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}