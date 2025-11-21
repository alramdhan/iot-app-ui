import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_ui/model/device_model.dart';
import 'package:flutter_svg/svg.dart';

class DeviceGridView extends StatefulWidget {
  const DeviceGridView({super.key});

  @override
  State<DeviceGridView> createState() => _DeviceGridViewState();
}

class _DeviceGridViewState extends State<DeviceGridView> {
  List<DeviceModel> devices = [
    DeviceModel(
      name: 'Smart Spotlight',
      isActive: true,
      color: Color(0xFFff5f5f),
      icon: 'assets/svg/light.svg',
    ),
    DeviceModel(
      name: 'Smart AC',
      isActive: true,
      color: Color(0xFF7739ff),
      icon: 'assets/svg/ac.svg',
    ),
    DeviceModel(
      name: 'Smart TV',
      isActive: false,
      color: Color(0xFFc9c306),
      icon: 'assets/svg/tv.svg',
    ),
    DeviceModel(
      name: 'Smart Sound',
      isActive: false,
      color: Color(0xFFc207db),
      icon: 'assets/svg/speaker.svg',
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),

        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: devices.length,
        itemBuilder: (BuildContext ctx, index) {
          return _deviceCard(
            name: devices[index].name!,
            svg: devices[index].icon!,
            color: devices[index].color!,
            isActive: devices[index].isActive,
            onChanged: (val) {
              setState(() {
                devices[index].isActive = !devices[index].isActive;
              });
            },
          );
        },
      ),
    );
  }

  Widget _deviceCard({
    required String name,
    required String svg,
    required Color color,
    required bool isActive,
    required Function(bool)? onChanged
  }) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openElevation: 0,
      middleColor: Color(0xFF7739ff),
      openShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      openBuilder: (BuildContext context, VoidCallback _) {
        // return ControlPanelPage(tag: name);
        return SizedBox();
      },
      tappable: name == "Smart AC" ? true : false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Colors.grey[400]!, width: 0.6),
            color: isActive ? color : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      svg,
                      colorFilter: ColorFilter.mode(
                        isActive ? Colors.white : Colors.black87,
                        BlendMode.srcIn,
                      ),
                      height: 25,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      name,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 15,
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  alignment: Alignment.center,
                  scaleY: 0.8,
                  scaleX: 0.85,
                  child: CupertinoSwitch(
                    onChanged: onChanged,
                    value: isActive,
                    activeTrackColor: isActive
                      ? Colors.white.withValues(alpha: 0.4)
                      : Colors.black,
                    inactiveTrackColor: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}