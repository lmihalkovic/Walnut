#pragma once
#include <iostream>
#include <string_view>

extern Walnut::Application* Walnut::CreateApplication(int argc, char** argv, char** envp);
bool g_ApplicationRunning = true;

namespace Walnut {

	int Main(int argc, char** argv, char **envp)
	{
		while (g_ApplicationRunning)
		{
			Walnut::Application* app = Walnut::CreateApplication(argc, argv, envp);
			app->Run();
			delete app;
		}

		return 0;
	}

}

#if defined(WL_PLATFORM_WINDOWS) && !defined(WL_HEADLESS) && defined(WL_DIST)

#include <Windows.h>

int APIENTRY WinMain(HINSTANCE hInst, HINSTANCE hInstPrev, PSTR cmdline, int cmdshow)
{
	return Walnut::Main(__argc, __argv, nullptr_t);
}

#else

int main(int argc, char** argv, char **envp)
{
	return Walnut::Main(argc, argv, envp);
}

#endif // defined(WL_PLATFORM_WINDOWS) && defined(WL_DIST)
