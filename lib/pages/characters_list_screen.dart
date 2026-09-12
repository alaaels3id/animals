import 'package:animals_app/models/character.dart';
import 'package:animals_app/styleguide.dart';
import 'package:animals_app/widgets/charcter_widget.dart';
import 'package:flutter/material.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  late final PageController _pageController;
  final TextEditingController _searchController = TextEditingController();
  int currentPage = 0;
  bool _isSearching = false;
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Character> get _filteredCharacters {
    var list = characters;

    if (_selectedCategory != 'All') {
      list = list
          .where(
            (c) => c.diet.toLowerCase() == _selectedCategory.toLowerCase(),
          )
          .toList();
    }

    if (_searchQuery.trim().isEmpty) return list;

    final q = _searchQuery.toLowerCase().trim();
    return list.where((c) {
      return c.name.toLowerCase().contains(q) ||
          c.subtitle.toLowerCase().contains(q) ||
          c.diet.toLowerCase().contains(q) ||
          c.habitat.toLowerCase().contains(q) ||
          c.description.toLowerCase().contains(q);
    }).toList();
  }

  int get _carnivoreCount =>
      characters.where((c) => c.diet.toLowerCase() == 'carnivore').length;
  int get _herbivoreCount =>
      characters.where((c) => c.diet.toLowerCase() == 'herbivore').length;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      currentPage = 0;
    });
    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchQuery = '';
        currentPage = 0;
      }
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      currentPage = 0;
    });
    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredCharacters;

    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: _isSearching
            ? null
            : Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 28,
                    color: Colors.black87,
                  ),
                  tooltip: 'Open menu',
                  onPressed: () => Scaffold.of(ctx).openDrawer(),
                ),
              ),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                onChanged: _onSearchChanged,
                style: const TextStyle(
                  fontFamily: 'WorkSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: 'Search animals, diet, habitat...',
                  hintStyle: TextStyle(
                    fontFamily: 'WorkSans',
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            _onSearchChanged('');
                          },
                        )
                      : null,
                ),
              )
            : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                _isSearching ? Icons.close_rounded : Icons.search_rounded,
                size: 26,
              ),
              tooltip: _isSearching ? 'Close search' : 'Search',
              onPressed: _toggleSearch,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, top: 4.0, right: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_selectedCategory != 'All')
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Chip(
                          label: Text(
                            'Category: $_selectedCategory',
                            style: const TextStyle(
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () {
                            setState(() {
                              _selectedCategory = 'All';
                              currentPage = 0;
                            });
                            if (_pageController.hasClients) {
                              _pageController.jumpToPage(0);
                            }
                          },
                          backgroundColor: Colors.orange.shade50,
                          side: BorderSide(color: Colors.orange.shade200),
                        ),
                      ),
                    _isSearching && _searchQuery.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Found ${filtered.length} ${filtered.length == 1 ? 'animal' : 'animals'}',
                                style: AppTheme.display2.copyWith(fontSize: 24),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'matching "$_searchQuery"',
                                style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        : RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Animals Kingdom',
                                  style: AppTheme.display1,
                                ),
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: 'Characters',
                                  style: AppTheme.display2,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filtered.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pets_rounded,
                              size: 72,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No animals found',
                              style: AppTheme.display2.copyWith(
                                fontSize: 22,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try searching with different keywords',
                              style: TextStyle(
                                fontFamily: 'WorkSans',
                                color: Colors.grey.shade500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : PageView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemCount: filtered.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return CharacterWidget(
                            character: filtered[index],
                            pageController: _pageController,
                            currentPage: index,
                          );
                        },
                      ),
              ),
              if (filtered.length > 1)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(filtered.length, (index) {
                      final isSelected = currentPage == index;
                      final activeColor =
                          filtered[currentPage.clamp(0, filtered.length - 1)]
                              .colors
                              .first;
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: isSelected ? 24 : 8,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? activeColor : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 64, 24, 28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade400, Colors.deepOrange.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.pets_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Animals Kingdom',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Explore wildlife & majestic fauna',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'CATEGORIES',
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                _drawerItem(
                  icon: Icons.grid_view_rounded,
                  title: 'All Animals',
                  count: characters.length,
                  isSelected: _selectedCategory == 'All',
                  onTap: () => _selectCategory('All'),
                ),
                _drawerItem(
                  icon: Icons.flash_on_rounded,
                  title: 'Carnivores',
                  count: _carnivoreCount,
                  isSelected: _selectedCategory == 'Carnivore',
                  onTap: () => _selectCategory('Carnivore'),
                ),
                _drawerItem(
                  icon: Icons.eco_rounded,
                  title: 'Herbivores',
                  count: _herbivoreCount,
                  isSelected: _selectedCategory == 'Herbivore',
                  onTap: () => _selectCategory('Herbivore'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(indent: 12, endIndent: 12),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'INFO',
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black87,
                  ),
                  title: const Text(
                    'About Animals App',
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationName: 'Animals Kingdom',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2026 Wildlife Explorer',
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Text(
                            'An interactive Flutter showcase exploring iconic wildlife characters with rich stats, facts, and visuals.',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: Text(
                  'Animals Kingdom v1.0.0',
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 12,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required int count,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.deepOrange : Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 15,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          color: isSelected ? Colors.deepOrange : Colors.black87,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepOrange.withValues(alpha: 0.12)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '$count',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.deepOrange : Colors.grey.shade700,
          ),
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.deepOrange.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }
}
