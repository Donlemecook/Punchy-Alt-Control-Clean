# 🎮 Punchy Alt Control - Clean Recreation

**Advanced Multi-Account Management for Roblox** (Unobfuscated, Readable Edition)

A feature-rich, clean Lua implementation for controlling armies of alt accounts with precision. Perfect for massive social experiments, coordinated events, or learning advanced Roblox scripting.

> **Note**: This is a clean, educational recreation based on the feature list of the original Punchy Alt Control. It is **not** a deobfuscation of the protected original.

---

## ✨ Features

- ✅ **60+ Commands**: From basic movement to complex orbital formations
- ✅ **Multi-Account Coordination**: Main account controls unlimited alts
- ✅ **Modular Architecture**: Separate, readable, extensible modules
- ✅ **60+ Formation Types**: Orbits, spirals, swarms, lines, circles, stacking
- ✅ **Animation System**: Dances, emotes, custom gestures
- ✅ **Movement Pathfinding**: Follow, pathfind, worm formations
- ✅ **Anti-AFK System**: Automatic input simulation to prevent disconnects
- ✅ **Performance Optimization**: FPS limiter, resource saver for alts
- ✅ **Authorization System**: Whitelist for trusted users
- ✅ **Interactive UI**: Main account command bar with auto-complete
- ✅ **Fully Documented**: Every function and module explained

---

## 🚀 Quick Start

### Prerequisites

1. **Executor**:
   - [SirHurt](https://sirhurt.net) (Recommended)
   - [Xeno](https://xeno.now) (Free alternative)

2. **Account Manager**:
   - [Roblox Account Manager (RAM)](https://github.com/ic3w0lf22/Roblox-Account-Manager) for multi-instance control

### Setup

1. **Configure Accounts in RAM**:
   - Add all alt accounts to RAM
   - Launch 1 main account + desired alts into the same server

2. **Script Configuration**:

```lua
-- CONFIG START
getgenv().Settings = {
    prefix = "/";
    mainAccount = "YOUR_MAIN_ACCOUNT_NAME";
    fpslimit = 30;  -- FPS cap for alt accounts
    
    -- List of alt accounts this script should control
    altAccounts = {
        ["ALT_1"] = true;
        ["ALT_2"] = true;
        ["ALT_3"] = true;
    };
    
    -- Authorized users who can run commands (besides main account)
    authorizedUsers = {
        ["TRUSTED_FRIEND"] = true;
    };
};
-- CONFIG END

loadstring(game:HttpGet("https://raw.githubusercontent.com/Donlemecook/Punchy-Alt-Control-Clean/main/init.lua", true))()
```

3. **Execute**:
   - Inject script on **all accounts** (main + alts)
   - Main account gets interactive command UI (press `'` to open)
   - Alts enter standby mode and await commands

---

## 📜 Command Reference

### 🔐 Authorization Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `/adduser [player]` | Authorize player to use commands | `/adduser PlayerName` |
| `/removeuser [player]` | Remove player's authorization | `/removeuser PlayerName` |
| `/listusers` | Show all authorized users | `/listusers` |

### 🎮 Basic Movement

| Command | Description | Usage |
|---------|-------------|-------|
| `/follow [player]` | Continuous following | `/follow PlayerName` |
| `/pf [player]` | Pathfind to player | `/pf PlayerName` |
| `/walkto [player]` | Direct walk to player | `/walkto PlayerName` |
| `/goto [player]` | Teleport to player | `/goto PlayerName` |
| `/stop` | Stop all active movements | `/stop` |

### 🎭 Animations & Effects

| Command | Description | Usage |
|---------|-------------|-------|
| `/dance1` | Roblox Dance 1 | `/dance1` |
| `/dance2` | Roblox Dance 2 | `/dance2` |
| `/dance3` | Roblox Dance 3 | `/dance3` |
| `/wave` | Wave gesture | `/wave` |
| `/point` | Point gesture | `/point` |
| `/cheer` | Cheer animation | `/cheer` |
| `/laugh` | Laugh animation | `/laugh` |
| `/spin [speed]` | Continuous spinning | `/spin 5` |
| `/float [height]` | Hover at height | `/float 10` |

### 🌌 Formation Commands

| Command | Pattern | Usage |
|---------|---------|-------|
| `/circle [player]` | Circular formation | `/circle PlayerName` |
| `/line [player]` | Line formation | `/line PlayerName` |
| `/rline [player]` | Right-side line | `/rline PlayerName` |
| `/lline [player]` | Left-side line | `/lline PlayerName` |
| `/bline [player]` | Behind line | `/bline PlayerName` |
| `/stackon [player]` | Vertical stack | `/stackon PlayerName` |
| `/worm [player]` | Train formation | `/worm PlayerName` |
| `/swarm [player]` | Chaotic swarm | `/swarm PlayerName` |
| `/swarm2 [player]` | 3D dome swarm | `/swarm2 PlayerName` |

### 🌀 Orbital & Spiral

| Command | Pattern | Usage |
|---------|---------|-------|
| `/orbit [player]` | Standard orbit | `/orbit PlayerName` |
| `/orbit2 [player]` | 45° tilted orbit | `/orbit2 PlayerName` |
| `/orbit3 [player]` | Electron cloud | `/orbit3 PlayerName` |
| `/spiral [player]` | Vertical helix | `/spiral PlayerName` |
| `/spiral2 [player]` | Horizontal helix | `/spiral2 PlayerName` |
| `/helicopter [player]` | Spinning blade | `/helicopter PlayerName` |

### ⚙️ Configuration Commands

| Command | Effect | Usage |
|---------|--------|-------|
| `/orbitspeed [1-10]` | Set orbit rotation speed | `/orbitspeed 5` |
| `/orbitradius [5-50]` | Set orbit diameter | `/orbitradius 15` |
| `/spiralspeed [1-10]` | Set spiral rotation speed | `/spiralspeed 3` |
| `/spiralradius [5-50]` | Set spiral diameter | `/spiralradius 20` |
| `/helicopterspeed [1-10]` | Set blade rotation speed | `/helicopterspeed 4` |
| `/helicopterradius [5-30]` | Set blade length | `/helicopterradius 10` |

### 💬 Chat & Spam

| Command | Description | Usage |
|---------|-------------|-------|
| `/chat [message]` | Make alts speak in chat | `/chat Hello world` |
| `/spam [message]` | Spam message repeatedly | `/spam Test` |
| `/unspam` | Stop spamming | `/unspam` |

### 🎪 Fun Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `/npc` | Make bots act like NPCs | `/npc` |
| `/unnpc` | Stop NPC mode | `/unnpc` |
| `/elevator [player]` | Create elevator beneath player | `/elevator PlayerName` |
| `/mine [player]` | Hidden mines that explode | `/mine PlayerName` |
| `/fling [player]` | Spin and fling player | `/fling PlayerName` |
| `/nuke [player]` | Launch down and explode | `/nuke PlayerName` |
| `/firework` | Launch and explode | `/firework` |

### 🛑 Stop Commands

| Command | Stops |
|---------|-------|
| `/stop` | ALL movements |
| `/unfollow` | Following |
| `/unworm` | Worm formation |
| `/unstack` | Stacking |
| `/unorbit` | Orbital movement |
| `/unspiral` | Spiral movement |
| `/unhelicopter` | Helicopter |
| `/unswarm` | Swarm pattern |
| `/unfloat` | Floating |
| `/unspin` | Spinning |

### ℹ️ Utility Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `/check` | Show bot position in list | `/check` |
| `/totalcmds` | Display command count | `/totalcmds` |
| `/credits` | Show credits | `/credits` |
| `/info [cmd]` | Get command info | `/info orbit` |

---

## 📁 Project Structure

```
Punchy-Alt-Control-Clean/
├── init.lua                 # Entry point - loads all modules
├── src/
│   ├── config.lua          # Configuration system
│   ├── command_parser.lua  # Command parsing & routing
│   ├── main_account.lua    # Main account UI & control logic
│   ├── alt_client.lua      # Alt account client behavior
│   ├── movement.lua        # Movement & pathfinding logic
│   ├── formations.lua      # Formation algorithms (circle, orbit, etc.)
│   ├── animations.lua      # Animation playback system
│   ├── effects.lua         # Visual effects (fling, nuke, etc.)
│   ├── chat.lua            # Chat & spam system
│   ├── anti_afk.lua        # Anti-AFK input simulation
│   └── ui.lua              # Interactive command bar UI
└── README.md
```

## 🔧 Architecture Overview

### Main Account Flow

1. Script loads configuration
2. Detects if running on main account
3. Creates interactive command UI
4. Listens for user input
5. Parses commands and broadcasts to alts
6. Coordinates multi-account behavior

### Alt Account Flow

1. Script loads configuration
2. Registers as alt account
3. Enters standby mode waiting for commands
4. Receives command broadcasts from main
5. Executes movement, animation, or effect commands
6. Reports status back to main account

### Command Dispatch System

- Commands parsed on main account
- Validated against authorization whitelist
- Serialized and broadcast to all connected alts
- Each alt interprets and executes its portion
- Maintains formation state and synchronization

---

## 📈 Performance Tips

- Use `/stop` before switching formations
- Lower FPS limit for 30+ alts (set to 10-15)
- Combine formations with animations for effect
- Use `/pf` for pathfinding around obstacles
- Close extra browser tabs/apps for better performance
- Run alts on lower graphics settings in Roblox

---

## 🚨 Troubleshooting

### Alts Not Responding

✅ Verify:
- All accounts are in the same server
- Account names match exactly in `Settings.altAccounts`
- Script has been injected on all accounts
- No firewalls blocking inter-account communication

### Commands Lagging

✅ Solution:
- Reduce number of alt accounts
- Lower `fpslimit` (minimum 10)
- Use `/stop` to clear background processes
- Restart the script

### Movement Not Working

✅ Check:
- Is the target player's name spelled correctly?
- Are the bots in a movable area (not in cutscenes)?
- Try `/stop` then reissue the command

---

## 📝 Code Examples

### Creating a Custom Command

Add to `src/command_parser.lua`:

```lua
local function handleCustomCommand(args)
    local target = args[1]
    -- Your custom logic here
    print("Custom command executed on " .. target)
end

commandHandlers["customcmd"] = handleCustomCommand
```

### Creating a Custom Formation

Add to `src/formations.lua`:

```lua
local function myCustomFormation(targetPos, botCount)
    local positions = {}
    for i = 1, botCount do
        positions[i] = targetPos + Vector3.new(i * 5, 0, 0)
    end
    return positions
end

formations["mycustom"] = myCustomFormation
```

---

## 📜 Credits

**Original Creator**: Punchy39 (punchingfella)

**Clean Recreation**: Donlemecook

**Inspired By**: The feature-rich design of the original Punchy Alt Control

---

## ⚠️ Disclaimer

This script is for **educational purposes only**. Not responsible for:
- Account bans or suspensions
- Game server impacts
- Unintended consequences of bot armies

**Use responsibly.** Roblox ToS prohibits automation and multi-accounting in many contexts. Use only in:
- Private servers you own
- Games that explicitly allow bots
- Educational/testing environments

---

## 🤝 Contributing

Feel free to fork, modify, and improve this recreation. This is an open-source educational project.

**To contribute**:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## 📚 Learning Resources

- [Roblox Lua Documentation](https://developer.roblox.com/)
- [Lua 5.1 Reference](https://www.lua.org/manual/5.1/)
- [Roblox Game API](https://developer.roblox.com/en-us/api-reference/)

---

**Last Updated**: October 2026
