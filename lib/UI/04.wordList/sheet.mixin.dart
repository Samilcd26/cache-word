import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin AddWordCardBottomDialogMixin {}

class AddImageOrVoiceDropMenu extends StatelessWidget {
  AddImageOrVoiceDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> test = [
      DropdownMenuItem(
        onTap: () {
          getLostData();
        },
        value: 1,
        child: const Row(
          children: [
            Icon(Icons.camera, color: Colors.white, size: 22),
            SizedBox(width: 10),
            Expanded(child: Text("Add Pictures", style: TextStyle(color: Colors.white))),
          ],
        ),
      )
    ];
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
            onChanged: (value) {},
            items: test,
            customButton: const Icon(Icons.add_circle_outline, size: 30, color: Colors.red),
            dropdownStyleData: DropdownStyleData(
              width: 160,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
              offset: const Offset(0, 8),
            )));
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
  }
}
