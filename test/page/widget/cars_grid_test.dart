import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdryve/cubit/cars_feed/cars_feed_cubit.dart';
import 'package:flutterdryve/cubit/cars_filter/cars_filter_cubit.dart';
import 'package:flutterdryve/model/brand_model.dart';
import 'package:flutterdryve/model/car_model.dart';
import 'package:flutterdryve/model/color_model.dart';
import 'package:flutterdryve/page/widget/cars_grid.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.dart';

void main() {
  final cars = [
    CarModel(
      id: '1',
      transmissionType: 'type',
      modelYear: 2020,
      modelName: 'Audi',
      mileage: 1000,
      price: 2000,
      imageUrl: 'image',
      fuelType: 'fuel',
      brandName: 'QQ',
    ),
    CarModel(
      id: '2',
      transmissionType: 'type',
      modelYear: 2020,
      modelName: 'Audi',
      mileage: 1000,
      price: 2000,
      imageUrl: 'image',
      fuelType: 'fuel',
      brandName: 'QQ',
    ),
  ];
  final brands = [
    BrandModel(brandId: '1', name: 'Audi'),
    BrandModel(brandId: '2', name: 'Ford'),
    BrandModel(brandId: '3', name: 'Ferrari'),
  ];
  final colors = [
    ColorModel(colorId: '1', name: 'Azul'),
  ];

  group('CarsGrid tests', () {
    testWidgets('should build without exploding', (tester) async {
      provideMockedNetworkImages(() async {
        final mockCarsFeedCubit = MockCarsFeedCubit();
        when(mockCarsFeedCubit.allCars).thenReturn(cars);
        when(mockCarsFeedCubit.allBrands).thenReturn(brands);
        when(mockCarsFeedCubit.allColors).thenReturn(colors);
        when(mockCarsFeedCubit.isCarFavorite(any)).thenReturn(false);
        final mockCarsFilterCubit = MockCarsFilterCubit();
        when(mockCarsFilterCubit.isColorPicked(any)).thenReturn(false);
        when(mockCarsFilterCubit.isBrandPicked(any)).thenReturn(false);
        when(mockCarsFilterCubit.pickedBrands).thenReturn([]);
        when(mockCarsFilterCubit.pickedColors).thenReturn([]);
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<CarsFeedCubit>(
                  create: (_) => mockCarsFeedCubit,
                ),
                BlocProvider<CarsFilterCubit>(
                  create: (_) => mockCarsFilterCubit,
                ),
              ],
              child: Scaffold(
                body: CarsGrid(
                  cars: cars,
                ),
              ),
            ),
          ),
        );
      });
    });

    testWidgets('should show empty info', (tester) async {
      provideMockedNetworkImages(() async {
        final mockCarsFeedCubit = MockCarsFeedCubit();
        when(mockCarsFeedCubit.allCars).thenReturn(cars);
        when(mockCarsFeedCubit.allBrands).thenReturn(brands);
        when(mockCarsFeedCubit.allColors).thenReturn(colors);
        when(mockCarsFeedCubit.isCarFavorite(any)).thenReturn(false);
        final mockCarsFilterCubit = MockCarsFilterCubit();
        when(mockCarsFilterCubit.isColorPicked(any)).thenReturn(false);
        when(mockCarsFilterCubit.isBrandPicked(any)).thenReturn(false);
        when(mockCarsFilterCubit.pickedBrands).thenReturn([]);
        when(mockCarsFilterCubit.pickedColors).thenReturn([]);
        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<CarsFeedCubit>(
                  create: (_) => mockCarsFeedCubit,
                ),
                BlocProvider<CarsFilterCubit>(
                  create: (_) => mockCarsFilterCubit,
                ),
              ],
              child: Scaffold(
                body: CarsGrid(
                  cars: [],
                ),
              ),
            ),
          ),
        );
        expect(find.text('Nenhum carro encontrado!'), findsOneWidget);
      });
    });
  });
}
