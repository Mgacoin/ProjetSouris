================================================================================
    BIBLIOTHÈQUE MFC (MICROSOFT FOUNDATION CLASS) : Vue d'ensemble du projet MFCApplication1
===============================================================================

L'Assistant Application a créé cette application MFCApplication1 pour vous. Cette application décrit non seulement les bases de l'utilisation de Microsoft Foundation Classes, mais est également un point de départ pour l'écriture de votre application.

Ce fichier contient un résumé du contenu de chacun des fichiers qui constituent votre application MFCApplication1.

MFCApplication1.vcxproj
    Il s'agit du fichier projet principal pour les projets VC++ générés à l'aide d'un Assistant Application. Il contient des informations sur la version de Visual C++ utilisée pour générer le fichier ainsi que des informations relatives aux plateformes, configurations et fonctionnalités du projet que vous avez sélectionnées dans l'Assistant Application.

MFCApplication1.vcxproj.filters
    Il s'agit du fichier de filtres pour les projets VC++ générés à l'aide d'un Assistant Application. Il contient des informations sur l'association entre les fichiers de votre projet et les filtres. Cette association est utilisée dans l'IDE pour afficher le regroupement des fichiers qui ont des extensions similaires sous un nœud spécifique (par exemple, les fichiers ".cpp" sont associés au filtre "Fichiers sources").

MFCApplication1.h
    Il s'agit du fichier d'en-tête principal pour l'application.
    Il comprend d'autres en-têtes spécifiques au projet (notamment Resource.h) et déclare la classe d'application CMFCApplication1App.

MFCApplication1.cpp
    Il s'agit du fichier source principal de l'application qui contient la classe d'application CMFCApplication1App.

MFCApplication1.rc
    Il s'agit de la liste de toutes les ressources Microsoft Windows utilisées par le programme. Il inclut les icônes, les bitmaps et les curseurs qui sont stockés dans le sous-répertoire RES. Ce fichier peut être directement modifié dans Microsoft Visual C++. Les ressources de votre projet se trouvent dans 1036.

res\MFCApplication1.ico
    Il s'agit d'un fichier icône, qui est utilisé comme icône de l'application. Cette icône est incluse par le fichier de ressources principal MFCApplication1.rc.

res\MFCApplication1.rc2
    Ce fichier contient les ressources qui ne sont pas modifiées par Microsoft Visual C++. Vous devez placer toutes les ressources non modifiables par l'éditeur de ressources dans ce fichier.

/////////////////////////////////////////////////////////////////////////////

Pour la fenêtre frame principale :
    Le projet inclut une interface MFC standard.

MainFrm.h, MainFrm.cpp
    Ces fichiers contiennent la classe frame CMainFrame, qui est dérivée de
    CMDIFrameWnd et contrôle toutes les fonctionnalités frame MDI.

res\Toolbar.bmp
    Ce fichier bitmap est utilisé pour créer des images en mosaïque pour la barre d'outils.
    La barre d'outils et la barre d'état initiales sont construites dans la classe CMainFrame. Modifiez cette bitmap de barre d'outils à l'aide de l'éditeur de ressources et mettez à jour le tableau IDR_MAINFRAME TOOLBAR dans MFCApplication1.rc de façon à ajouter des boutons de barre d'outils.
/////////////////////////////////////////////////////////////////////////////

Pour la fenêtre frame enfant :

ChildFrm.h, ChildFrm.cpp
    Ces fichiers définissent et implémentent la classe CChildFrame, qui prend en charge les fenêtres enfants dans une application MDI.

/////////////////////////////////////////////////////////////////////////////

L'Assistant Application crée un type de document et une vue :

MFCApplication1Doc.h, MFCApplication1Doc.cpp - le document
    Ces fichiers contiennent votre classe CMFCApplication1Doc. Modifiez ces fichiers pour ajouter vos données spéciales de document et implémenter l'enregistrement et le chargement de fichier (via CMFCApplication1Doc::Serialize).

MFCApplication1View.h, MFCApplication1View.cpp - la vue du document
    Ces fichiers contiennent votre classe CMFCApplication1View.
    Les objets CMFCApplication1View sont utilisés pour afficher les objets CMFCApplication1Doc.

res\MFCApplication1Doc.ico
    Il s'agit d'un fichier icône, qui est utilisé comme icône pour les fenêtres enfants MDI de la classe CMFCApplication1Doc. Cette icône est incluse par le fichier de ressources principal MFCApplication1.rc.



/////////////////////////////////////////////////////////////////////////////

Autres fonctionnalités :

Contrôles ActiveX
    L'application inclut la prise en charge pour l'utilisation des contrôles ActiveX.

Prise en charge de l'impression et de l'aperçu avant impression
    L'Assistant Application a généré le code pour gérer les commandes d'impression, de configuration de l'impression et d'aperçu avant impression en appelant les fonctions membres dans la classe CView à partir de la bibliothèque MFC.

/////////////////////////////////////////////////////////////////////////////

Autres fichiers standard :

StdAfx.h, StdAfx.cpp
    Ces fichiers sont utilisés pour générer un fichier d'en-tête précompilé (PCH) MFCApplication1.pch et un fichier de type précompilé nommé StdAfx.obj.

Resource.h
    Il s'agit du ficher d'en-tête standard, qui définit les nouveaux ID de ressources. Microsoft Visual C++ lit et met à jour ce fichier.

MFCApplication1.manifest
	Windows XP utilise les fichiers de manifeste d'application pour décrire la dépendance d'une application sur des versions spécifiques d'assemblys côte à côte. Le chargeur utilise ces informations pour charger l'assembly approprié à partir du cache d'assembly ou privé à partir de l'application. Le manifeste d'application peut être inclus pour une redistribution en tant que fichier .manifest installé dans le même dossier que l'exécutable de l'application. Il peut aussi être inclus dans l'exécutable sous la forme d'une ressource.
/////////////////////////////////////////////////////////////////////////////

Autres remarques :

L'Assistant Application utilise des commentaires "TODO:" pour indiquer les parties du code source où vous devrez ajouter ou modifier du code.

Si votre application utilise des MFC dans une DLL partagée, vous devez redistribuer les DLL MFC. Si la langue de votre application ne correspond pas aux paramètres régionaux du système d'exploitation, vous devrez également redistribuer les ressources localisées correspondantes mfc110XXX.DLL.
Pour plus d'informations sur ces deux rubriques, consultez la section sur la redistribution des applications Visual C++ dans la documentation MSDN.

/////////////////////////////////////////////////////////////////////////////
