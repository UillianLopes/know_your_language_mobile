import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MenuItem {
  IconData? icon;
  String? text;

  MenuItem({this.icon, this.text});
}

class PositionedFloatingMenu extends StatefulWidget {
  final List<MenuItem> items;

  final double padding;
  final double itemSize;
  final double? bottom;
  final double? top;
  final int? selectedIndex;
  final Function(int) onItemSelected;

  const PositionedFloatingMenu({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.selectedIndex,
    this.bottom,
    this.top,
    this.itemSize = 40.0,
    this.padding = 8.0,
  });

  @override
  State<PositionedFloatingMenu> createState() => _PositionedFloatingMenuState();
}

class _PositionedFloatingMenuState extends State<PositionedFloatingMenu>
    with TickerProviderStateMixin {
  late int _selectedIndex;
  int? _prevSelectedIndex;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 0.00,
      lowerBound: 0.00,
      upperBound: 1.00,
      duration: 100.ms,
    );

    _selectedIndex = widget.selectedIndex ?? 0;

    super.initState();
  }

  @override
  void didUpdateWidget(PositionedFloatingMenu oldWidget) {
    if (widget.selectedIndex != null &&
        widget.selectedIndex != _selectedIndex &&
        !_animationController.isAnimating) {
      setState(() {
        _prevSelectedIndex = _selectedIndex;
        _selectedIndex = widget.selectedIndex ?? 0;
        _animationController.forward(from: 0);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  _calcCurrentPosition() {
    if (_prevSelectedIndex == null) {
      return _selectedIndex * widget.itemSize;
    }

    if (_prevSelectedIndex! > _selectedIndex) {
      return (_prevSelectedIndex! * widget.itemSize) -
          (((_prevSelectedIndex! - _selectedIndex) * widget.itemSize) *
              _animationController.value);
    }

    return (_prevSelectedIndex! * widget.itemSize) +
        (((_selectedIndex - (_prevSelectedIndex ?? 0)) * widget.itemSize) *
            _animationController.value);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottom,
      top: widget.top,
      left: MediaQuery.of(context).size.width / 2 -
          ((widget.itemSize * widget.items.length + widget.padding * 2) / 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.itemSize),
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.all(widget.padding),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, wd) {
                return Positioned(
                  left: _calcCurrentPosition(),
                  child: Container(
                    width: widget.itemSize,
                    height: widget.itemSize,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(widget.itemSize / 2),
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                ...widget.items.map(
                  (item) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (_animationController.isAnimating) {
                        return;
                      }

                      setState(() {
                        _prevSelectedIndex = _selectedIndex;
                        _selectedIndex = widget.items.indexOf(item);
                        _animationController.forward(from: 0);
                        widget.onItemSelected(_selectedIndex);
                      });
                    },
                    child: SizedBox(
                      width: widget.itemSize,
                      height: widget.itemSize,
                      child: Icon(item.icon),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
