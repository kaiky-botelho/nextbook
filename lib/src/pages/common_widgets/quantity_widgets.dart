import 'package:flutter/material.dart';

class QuantityWidgets extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidgets({
    super.key,
    required this.value,
    required this.suffixText,
    required this.result,
    this.isRemovable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            color: Colors.white, // Ícone branco
            onPressed: () {
              if (value == 1 && !isRemovable ) return;
              int resultCount = value - 1;
              result(resultCount);
            },
            backgroundColor: !isRemovable || value > 1 ? Colors.grey : Colors.red, // Fundo cinza
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: Colors.white, // Ícone branco
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
            backgroundColor: Colors.green, // Fundo verde
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color; // Cor do ícone
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor; // Nova propriedade para cor de fundo

  const _QuantityButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.grey, // Cor padrão de fundo
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Transparente para evitar que a cor padrão se sobreponha
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: backgroundColor, // Cor de fundo ajustável
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color, // Cor do ícone ajustável
            size: 16,
          ),
        ),
      ),
    );
  }
}
