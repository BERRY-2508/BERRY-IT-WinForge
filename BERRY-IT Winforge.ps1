# BERRY IT: WinForge - Infinity Symbol, Less Spacing, Not Bold

Add-Type -AssemblyName PresentationFramework

if (-not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$logoPath = "https://github.com/BERRY-2508/BERRY.IT.WEB/blob/main/BERRY-IT.png"
if (-not (Test-Path $logoPath)) { $logoPath = "" }

$apps = @(
    @{ Name = "7-Zip"; Id = "7zip.7zip" },
    @{ Name = "Google Chrome"; Id = "Google.Chrome" },
    @{ Name = "Mozilla Firefox"; Id = "Mozilla.Firefox" },
    @{ Name = "Microsoft Edge"; Id = "Microsoft.Edge" },
    @{ Name = "Brave Browser"; Id = "Brave.Brave" },
    @{ Name = "Notepad++"; Id = "Notepad++.Notepad++" },
    @{ Name = "Visual Studio Code"; Id = "Microsoft.VisualStudioCode" },
    @{ Name = "Git"; Id = "Git.Git" },
    @{ Name = "PowerShell 7"; Id = "Microsoft.PowerShell" },
    @{ Name = "Windows Terminal"; Id = "Microsoft.WindowsTerminal" },
    @{ Name = "VLC Media Player"; Id = "VideoLAN.VLC" },
    @{ Name = "Spotify"; Id = "Spotify.Spotify" },
    @{ Name = "Discord"; Id = "Discord.Discord" },
    @{ Name = "Steam"; Id = "Valve.Steam" },
    @{ Name = "OBS Studio"; Id = "OBSProject.OBSStudio" },
    @{ Name = "ShareX"; Id = "ShareX.ShareX" },
    @{ Name = "Rufus"; Id = "Rufus.Rufus" },
    @{ Name = "CPU-Z"; Id = "CPUID.CPU-Z" },
    @{ Name = "HWMonitor"; Id = "CPUID.HWMonitor" },
    @{ Name = "WinDirStat"; Id = "WinDirStat.WinDirStat" },
    @{ Name = "Paint.NET"; Id = "dotPDNLLC.paintdotnet" },
    @{ Name = "GIMP"; Id = "GIMP.GIMP" },
    @{ Name = "LibreOffice"; Id = "TheDocumentFoundation.LibreOffice" },
    @{ Name = "KeePass"; Id = "DominikReichl.KeePass" },
    @{ Name = "TeamViewer"; Id = "TeamViewer.TeamViewer" },
    @{ Name = "AnyDesk"; Id = "AnyDeskSoftwareGmbH.AnyDesk" },
    @{ Name = "Zoom"; Id = "Zoom.Zoom" },
    @{ Name = "qBittorrent"; Id = "qBittorrent.qBittorrent" },
    @{ Name = "Transmission"; Id = "Transmission.Transmission" },
    @{ Name = "FileZilla"; Id = "FileZilla.FileZilla" },
    @{ Name = "Python 3"; Id = "Python.Python.3" },
    @{ Name = "Node.js LTS"; Id = "OpenJS.NodeJS.LTS" },
    @{ Name = "Docker Desktop"; Id = "Docker.DockerDesktop" },
    @{ Name = "Putty"; Id = "PuTTY.PuTTY" },
    @{ Name = "Everything Search"; Id = "voidtools.Everything" },
    @{ Name = "VeraCrypt"; Id = "IDRIX.VeraCrypt" },
    @{ Name = "BleachBit"; Id = "BleachBit.BleachBit" }
)

$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="BERRY IT: WinForge"
        Height="800" Width="1220"
        Background="#1e1e1e"
        WindowStartupLocation="CenterScreen"
        FontFamily="Orbitron"
        Foreground="White">
    <Window.Resources>
        <SolidColorBrush x:Key="BerryRed" Color="#F50019"/>
        <SolidColorBrush x:Key="BerryWhite" Color="#FFFFFF"/>
        <SolidColorBrush x:Key="BerryGray" Color="#191919"/>
        <Style TargetType="Button" x:Key="AppButton">
            <Setter Property="FontFamily" Value="Orbitron"/>
            <Setter Property="Foreground" Value="{StaticResource BerryWhite}"/>
            <Setter Property="Background" Value="#242424"/>
            <Setter Property="BorderBrush" Value="#232323"/>
            <Setter Property="BorderThickness" Value="2"/>
            <Setter Property="Margin" Value="0,0,0,16"/>
            <Setter Property="Width" Value="240"/>
            <Setter Property="Height" Value="44"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="FontSize" Value="15"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}" 
                                CornerRadius="7">
                            <Border.Effect>
                                <DropShadowEffect BlurRadius="8" Color="#99000000" ShadowDepth="1" Opacity="0.24"/>
                            </Border.Effect>
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#292929"/>
                                <Setter Property="BorderBrush" Value="{StaticResource BerryRed}"/>
                                <Setter Property="Foreground" Value="{StaticResource BerryRed}"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter Property="Background" Value="{StaticResource BerryRed}"/>
                                <Setter Property="Foreground" Value="{StaticResource BerryWhite}"/>
                                <Setter Property="BorderBrush" Value="#DDDDDD"/>
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter Property="Background" Value="#111111"/>
                                <Setter Property="Foreground" Value="#666666"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        <Style TargetType="Button" x:Key="AppPrimaryButton" BasedOn="{StaticResource AppButton}">
            <Setter Property="Background" Value="{StaticResource BerryRed}"/>
            <Setter Property="Foreground" Value="{StaticResource BerryWhite}"/>
            <Setter Property="BorderBrush" Value="{StaticResource BerryRed}"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}" 
                                CornerRadius="7">
                            <Border.Effect>
                                <DropShadowEffect BlurRadius="12" Color="#60F50019" ShadowDepth="1" Opacity="0.35"/>
                            </Border.Effect>
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#ED1934"/>
                                <Setter Property="BorderBrush" Value="#ED1934"/>
                                <Setter Property="Foreground" Value="White"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter Property="Background" Value="#BA0014"/>
                                <Setter Property="Foreground" Value="White"/>
                                <Setter Property="BorderBrush" Value="#990011"/>
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter Property="Background" Value="#333333"/>
                                <Setter Property="Foreground" Value="#888888"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
        <Style TargetType="Button" x:Key="AppDangerButton" BasedOn="{StaticResource AppButton}">
            <Setter Property="Foreground" Value="{StaticResource BerryRed}"/>
            <Setter Property="BorderBrush" Value="{StaticResource BerryRed}"/>
            <Setter Property="Background" Value="#1a1a1a"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}" 
                                CornerRadius="7">
                            <Border.Effect>
                                <DropShadowEffect BlurRadius="8" Color="#60F50019" ShadowDepth="1" Opacity="0.20"/>
                            </Border.Effect>
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#300"/>
                                <Setter Property="Foreground" Value="#fff"/>
                                <Setter Property="BorderBrush" Value="{StaticResource BerryRed}"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter Property="Background" Value="{StaticResource BerryRed}"/>
                                <Setter Property="Foreground" Value="White"/>
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter Property="Background" Value="#232323"/>
                                <Setter Property="Foreground" Value="#666666"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>
        <!-- HEADER -->
        <StackPanel Orientation="Horizontal" Background="#212121" Height="64" VerticalAlignment="Top">
            <Image x:Name="logo" Width="48" Height="48" Margin="16,8,0,8"/>
            <TextBlock Text="BERRY IT: WinForge" FontSize="32" FontWeight="Bold" Foreground="#F50019" VerticalAlignment="Center" Margin="16,0,0,0"/>
        </StackPanel>
        <!-- TABS -->
        <TabControl x:Name="mainTabs" Grid.Row="1" Margin="24,18,24,24" Background="#191919" BorderThickness="0" FontSize="17" FontWeight="SemiBold">
            <!-- SYSTEM INFO TAB -->
            <TabItem Header="System Info">
                <StackPanel Margin="28,16,28,28">
                    <TextBlock Text="System Information" FontSize="24" FontWeight="Bold" Foreground="#F50019" Margin="0,0,0,16"/>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="Operating System: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="osInfo" Foreground="White"/>
                    </StackPanel>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="CPU: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="cpuInfo" Foreground="White"/>
                    </StackPanel>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="RAM: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="ramInfo" Foreground="White"/>
                    </StackPanel>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="Disk: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="diskInfo" Foreground="White"/>
                    </StackPanel>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="GPU: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="gpuInfo" Foreground="White"/>
                    </StackPanel>
                    <StackPanel Orientation="Horizontal" Margin="0,0,0,8">
                        <TextBlock Text="Uptime: " FontWeight="Bold" Foreground="White"/>
                        <TextBlock x:Name="uptimeInfo" Foreground="White"/>
                    </StackPanel>
                </StackPanel>
            </TabItem>
            <!-- APP INSTALLER TAB (Berry IT Themed) -->
            <TabItem Header="App Installer">
                <DockPanel LastChildFill="True" Margin="20">
                    <StackPanel Width="290" DockPanel.Dock="Left">
                        <TextBlock Text="App Installer" FontSize="22" FontWeight="SemiBold" Foreground="#F50019" Margin="0,0,0,18"/>
                        <TextBox x:Name="searchBox" Width="240" Height="32" Margin="0,0,0,14"/>
                        <StackPanel Orientation="Vertical" Margin="0,0,0,0" HorizontalAlignment="Center">
                            <Button x:Name="btnCheckAll" Content="Check All" Style="{StaticResource AppButton}"/>
                            <Button x:Name="btnUncheckAll" Content="Uncheck All" Style="{StaticResource AppButton}"/>
                        </StackPanel>
                        <Button x:Name="btnGetInstalled" Content="Get Installed" Style="{StaticResource AppButton}"/>
                        <Button x:Name="btnInstall" Content="Install Selected Apps" Style="{StaticResource AppPrimaryButton}" Margin="0,0,0,18"/>
                        <Button x:Name="btnUninstall" Content="Uninstall Selected Apps" Style="{StaticResource AppDangerButton}" Margin="0,0,0,6"/>
                    </StackPanel>
                    <StackPanel Margin="32,0,0,0">
                        <ScrollViewer Height="480" VerticalScrollBarVisibility="Auto">
                            <UniformGrid x:Name="appsGrid" Columns="3" Margin="0,0,0,0"/>
                        </ScrollViewer>
                        <ProgressBar x:Name="progressBar" Height="18" Margin="0,18,0,0" Minimum="0" Maximum="100" Visibility="Collapsed"/>
                        <TextBlock x:Name="logPanel" Margin="0,16,0,0" TextWrapping="Wrap" FontFamily="Consolas" FontSize="15" Foreground="#DDDDDD"/>
                    </StackPanel>
                </DockPanel>
            </TabItem>
            <!-- TWEAKS TAB -->
            <TabItem Header="Tweaks">
                <StackPanel Margin="28,16,28,28">
                    <TextBlock Text="Windows Tweaks" FontSize="24" FontWeight="Bold" Foreground="#F50019" Margin="0,0,0,16"/>
                    <Button Content="Dark Mode On" Width="180" Margin="0,0,0,6" x:Name="btnDarkMode"/>
                    <Button Content="Dark Mode Off" Width="180" Margin="0,0,0,6" x:Name="btnLightMode"/>
                    <Button Content="Disable Cortana" Width="180" Margin="0,0,0,6" x:Name="btnDisableCortana"/>
                </StackPanel>
            </TabItem>
            <!-- SYSTEM TOOLS TAB -->
            <TabItem Header="System Tools">
                <StackPanel Margin="28,16,28,28">
                    <TextBlock Text="System Tools" FontSize="24" FontWeight="Bold" Foreground="#F50019" Margin="0,0,0,16"/>
                    <Button Content="Open Device Manager" Width="220" Margin="0,0,0,10" x:Name="btnDeviceManager"/>
                    <Button Content="Open Task Manager" Width="220" Margin="0,0,0,10" x:Name="btnTaskManager"/>
                    <Button Content="Open Control Panel" Width="220" Margin="0,0,0,10" x:Name="btnControlPanel"/>
                </StackPanel>
            </TabItem>
            <!-- BERRYFIX TAB -->
            <TabItem Header="BerryFix">
                <StackPanel Margin="28,16,28,28">
                    <TextBlock Text="BerryFix" FontSize="24" FontWeight="Bold" Foreground="#F50019" Margin="0,0,0,16"/>
                    <Button Content="Run SFC Scan" Width="220" Margin="0,0,0,8" x:Name="btnSFC"/>
                    <Button Content="Run DISM RestoreHealth" Width="220" Margin="0,0,0,8" x:Name="btnDISM"/>
                </StackPanel>
            </TabItem>
            <!-- ABOUT TAB -->
            <TabItem Header="About">
                <Grid>
                    <StackPanel Margin="28,16,28,72">
                        <TextBlock Text="About BERRY IT: WinForge" FontSize="24" FontWeight="Bold" Foreground="#F50019" Margin="0,0,0,16"/>
                        <TextBlock
                            Text="BERRY IT: WinForge is your one-stop system utility and software installer for Windows, powered by BERRY IT."
                            FontSize="17" TextWrapping="Wrap" Margin="0,0,0,16" Foreground="White"/>
                        <TextBlock x:Name="websiteTextBlock" Text="Website: https://berryit.com.au" FontSize="16" Foreground="#F50019" Cursor="Hand"/>
                    </StackPanel>
                    <!-- Version Label in Bottom Right, All Light Grey -->
                    <StackPanel Orientation="Horizontal"
                                HorizontalAlignment="Right"
                                VerticalAlignment="Bottom"
                                Margin="0,0,8,8">
                        <TextBlock Text="Version" FontSize="13" FontWeight="Bold" Foreground="#CCCCCC"
                            VerticalAlignment="Center">
                            <TextBlock.Effect>
                                <DropShadowEffect ShadowDepth="0" Color="#F50019" BlurRadius="0" Opacity="1"/>
                            </TextBlock.Effect>
                        </TextBlock>
                        <TextBlock Text=" ∞ " FontSize="24" FontWeight="Normal" Foreground="#CCCCCC"
                            Margin="2,0,2,0" VerticalAlignment="Center">
                            <TextBlock.Effect>
                                <DropShadowEffect ShadowDepth="0" Color="#F50019" BlurRadius="0" Opacity="1"/>
                            </TextBlock.Effect>
                        </TextBlock>
                        <TextBlock Text="Forked from the best, Broken by me"
                            FontSize="13" FontWeight="Bold" Foreground="#CCCCCC"
                            VerticalAlignment="Center">
                            <TextBlock.Effect>
                                <DropShadowEffect ShadowDepth="0" Color="#F50019" BlurRadius="0" Opacity="1"/>
                            </TextBlock.Effect>
                        </TextBlock>
                    </StackPanel>
                </Grid>
            </TabItem>
        </TabControl>
    </Grid>
</Window>
"@

Add-Type -AssemblyName PresentationCore,PresentationFramework
[xml]$xamlWindow = $xaml
$reader = (New-Object System.Xml.XmlNodeReader $xamlWindow)
$window = [Windows.Markup.XamlReader]::Load($reader)

# LOGO LOAD
if ($logoPath -and $window.FindName("logo")) {
    $logo = $window.FindName("logo")
    $logo.Source = [Windows.Media.Imaging.BitmapImage]::new([Uri]::new($logoPath))
}

# SYSTEM INFO
$sys = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$ramGB = [math]::Round($sys.TotalVisibleMemorySize/1MB,1)
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Sort-Object Size -Descending | Select-Object -First 1
$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
$uptime = (Get-Date) - $sys.LastBootUpTime

$window.FindName("osInfo").Text = $sys.Caption + " " + $sys.Version
$window.FindName("cpuInfo").Text = $cpu.Name
$window.FindName("ramInfo").Text = "$ramGB GB"
$window.FindName("diskInfo").Text = "$([math]::Round($disk.Size/1GB,1)) GB ($($disk.DeviceID))"
$window.FindName("gpuInfo").Text = $gpu.Name
$window.FindName("uptimeInfo").Text = "{0} days, {1:hh} hrs, {1:mm} mins" -f $uptime.Days, $uptime

# APP INSTALLER LOGIC (UniformGrid 3 Columns)
function Add-AppCheckboxes {
    param($appsToShow)
    $appsGrid = $window.FindName("appsGrid")
    $appsGrid.Children.Clear()
    foreach ($app in $appsToShow) {
        $cb = New-Object System.Windows.Controls.CheckBox
        $cb.Content = $app.Name
        $cb.Tag = $app.Id
        $cb.Margin = '8,2,8,8'
        $cb.Foreground = [System.Windows.Media.Brushes]::White
        $cb.FontSize = 16
        $cb.ToolTip = $app.Id
        $appsGrid.Children.Add($cb)
    }
}
Add-AppCheckboxes $apps

$window.FindName("btnCheckAll").Add_Click({
    foreach ($item in $window.FindName("appsGrid").Children) { $item.IsChecked = $true }
})
$window.FindName("btnUncheckAll").Add_Click({
    foreach ($item in $window.FindName("appsGrid").Children) { $item.IsChecked = $false }
})
$window.FindName("searchBox").Add_TextChanged({
    $q = $window.FindName("searchBox").Text.Trim().ToLower()
    $filtered = if ($q) { $apps | Where-Object { $_.Name.ToLower().Contains($q) } } else { $apps }
    Add-AppCheckboxes $filtered
})

$window.FindName("btnGetInstalled").Add_Click({
    $installedList = winget list --source=winget
    foreach ($item in $window.FindName("appsGrid").Children) {
        $item.IsChecked = $false
        if ($installedList -match $item.Tag) { $item.IsChecked = $true }
    }
    $window.FindName("logPanel").Text = "Detected and pre-selected all currently installed apps."
})
$window.FindName("btnInstall").Add_Click({
    $window.FindName("progressBar").Visibility = "Visible"
    $checked = $window.FindName("appsGrid").Children | Where-Object { $_.IsChecked }
    $total = $checked.Count
    $count = 0
    foreach ($cb in $checked) {
        $id = $cb.Tag
        $name = $cb.Content
        $already = (winget list --id $id | Select-String $id)
        if ($already) {
            $window.FindName("logPanel").Text += "$name is already installed. Skipping.`n"
        } else {
            $window.FindName("logPanel").Text += "Installing $name...`n"
            $res = winget install --id $id --accept-source-agreements --accept-package-agreements -h
            $window.FindName("logPanel").Text += $res
        }
        $count++
        $window.FindName("progressBar").Value = [math]::Round(($count/$total)*100)
    }
    $window.FindName("progressBar").Visibility = "Collapsed"
    $window.FindName("logPanel").Text += "`nInstallation complete."
})
$window.FindName("btnUninstall").Add_Click({
    $checked = $window.FindName("appsGrid").Children | Where-Object { $_.IsChecked }
    if (-not $checked) {
        [System.Windows.MessageBox]::Show("No apps selected to uninstall.", "BERRY IT: WinForge", "OK", "Warning")
        return
    }
    $result = [System.Windows.MessageBox]::Show("Are you sure you want to uninstall the selected apps?", "Uninstall Confirmation", "YesNo", "Warning")
    if ($result -ne "Yes") { return }
    $window.FindName("progressBar").Visibility = "Visible"
    $total = $checked.Count
    $count = 0
    foreach ($cb in $checked) {
        $id = $cb.Tag
        $name = $cb.Content
        $window.FindName("logPanel").Text += "Uninstalling $name...`n"
        $res = winget uninstall --id $id -h
        $window.FindName("logPanel").Text += $res
        $count++
        $window.FindName("progressBar").Value = [math]::Round(($count/$total)*100)
    }
    $window.FindName("progressBar").Visibility = "Collapsed"
    $window.FindName("logPanel").Text += "`nUninstall complete."
})

# TWEAKS TAB
$window.FindName("btnDarkMode").Add_Click({ Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 })
$window.FindName("btnLightMode").Add_Click({ Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 })
$window.FindName("btnDisableCortana").Add_Click({
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0 -Force
    [System.Windows.MessageBox]::Show("Cortana disabled. Please reboot for changes to take effect.", "Done")
})

# SYSTEM TOOLS TAB
$window.FindName("btnDeviceManager").Add_Click({ Start-Process devmgmt.msc })
$window.FindName("btnTaskManager").Add_Click({ Start-Process taskmgr })
$window.FindName("btnControlPanel").Add_Click({ Start-Process control })

# BERRYFIX TAB
$window.FindName("btnSFC").Add_Click({
    Start-Process powershell -ArgumentList "-Command sfc /scannow; pause" -Verb RunAs
})
$window.FindName("btnDISM").Add_Click({
    Start-Process powershell -ArgumentList "-Command DISM /Online /Cleanup-Image /RestoreHealth; pause" -Verb RunAs
})

# ABOUT TAB (Website link handler)
$websiteBlock = $window.FindName("websiteTextBlock")
if ($websiteBlock) {
    $websiteBlock.Add_MouseLeftButtonUp({
        Start-Process "https://berryit.com.au"
    })
}

# SHOW WINDOW
$window.ShowDialog() | Out-Null
