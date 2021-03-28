class Helper extends Info
  abstract;


var localized array<string> CustomHints;


static function array<string> ReturnHints()
{
  return default.CustomHints;
}


// help list for zed spawning
static function TellAbout(PlayerController pc, FleshpoundParty FPP, string whatToTell)
{
  local int i,n;
  local array<string> Temp;

  switch(whatToTell)
  {
    case "HelpMessages":
      Temp = default.CustomHints;
      break;
  }

  n = Temp.Length;

  for (i = 0; i < n; i++)
  {
    FPP.SendMessage(pc, Temp[i]);
  }
}


// color codes for messages
static function string ParseFormattedLine(string input)
{
  ReplaceText(input, "%r", chr(27)$chr(200)$chr(1)$chr(1));
  ReplaceText(input, "%g", chr(27)$chr(1)$chr(200)$chr(1));
  ReplaceText(input, "%b", chr(27)$chr(1)$chr(100)$chr(200));
  ReplaceText(input, "%w", chr(27)$chr(200)$chr(200)$chr(200));
  ReplaceText(input, "%y", chr(27)$chr(200)$chr(200)$chr(1));
  ReplaceText(input, "%p", chr(27)$chr(200)$chr(1)$chr(200));

  return input;
}


static function string StripColor(string s)
{
  local int p;

  p = InStr(s,chr(27));
  while ( p>=0 )
  {
    s = left(s,p)$mid(S,p+4);
     p = InStr(s,Chr(27));
  }

  return s;
}


// remove color codes
static function string StripFormattedString(string input)
{
  ReplaceText(input, "%r", "");
  ReplaceText(input, "%g", "");
  ReplaceText(input, "%b", "");
  ReplaceText(input, "%w", "");
  ReplaceText(input, "%y", "");
  ReplaceText(input, "%p", "");
  ReplaceText(input, "^1", "");
  ReplaceText(input, "^2", "");
  ReplaceText(input, "^3", "");
  ReplaceText(input, "^4", "");
  ReplaceText(input, "^5", "");
  ReplaceText(input, "^6", "");
  ReplaceText(input, "^7", "");
  ReplaceText(input, "^8", "");
  ReplaceText(input, "^0", "");

  return input;
}


static function string ParsePlayerName(PlayerController pc)
{
  if (pc != none || pc.playerReplicationInfo != none)
    return "%b" $ StripFormattedString(pc.playerReplicationInfo.PlayerName) $ "%w";
}


defaultproperties
{
  CustomHints(0)="We all wipe down here."
  CustomHints(1)="If all your perks are level 6 you clearly suck because you have no life."
  CustomHints(2)="Not all heroes wear a cape, some just use an AA12."
  CustomHints(3)="Such Super Sick SeekerSix Skillz!"
  CustomHints(4)="Always remember to press Q to win!"
  CustomHints(5)="If you can't finish it, don't rage it."
  CustomHints(6)="Behind every great Fleshpound there is always a great Siren."
  CustomHints(7)="Remember: if you died, it's always someone else's fault."
  CustomHints(8)="True professionals can still carry their team while AFK."
  CustomHints(9)="The Firebug. Yes, that is a Flamethrower he's carrying. Nothing subtle about him."
  CustomHints(10)="The Firebug tends to live up to its name, so watch out for it spamming flames towards you."
  CustomHints(11)="The Commando is not that dangerous - but does have a nasty habit of raging bigger zeds and then trying to get away, so keep him at a distance."
  CustomHints(12)="Bloats will explode in a shower of candy when they die. Make sure there's a team mate near when taking them down, for a wonderful surprise!"
  CustomHints(13)="Demolitionist, not too hard to kill, but its Pipe Bombs stay even after it dies, so make sure you keep out of range when they eventually enrage something."
  CustomHints(14)="The Firebug is a real spammer. Very nasty. Its flames are not just annoying - they'll trigger grenades and rockets in mid-air!"
  CustomHints(15)="The Fleshpound. Shooting him with small weapons just makes your team mates mad."
  CustomHints(16)="The Sharpshooter. This is the big One. M14. LAR. And a 9mm, too!"
  CustomHints(17)="Sharpshooter addendum: Did we forget to brief you? Yes, they can take on anything without your help. Just leave them to their short, angry lives."
  CustomHints(18)="Never question the LAW, for the LAW is sacred."
}