cask 'unity-samsung-tv-support-for-editor@2017.1.5f1' do
  version '2017.1.5f1,9758a36cfaa6'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/9758a36cfaa6/MacEditorTargetInstaller/UnitySetup-Samsung-TV-Support-for-Editor-2017.1.5f1.pkg"
  name 'SamsungTV Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Samsung-TV-Support-for-Editor-2017.1.5f1.pkg'

  depends_on cask: 'unity@2017.1.5f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.1.5f1"
      FileUtils.move "/Applications/Unity-2017.1.5f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.1.5f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.1.5f1/PlaybackEngines/STVPlayer'
end
