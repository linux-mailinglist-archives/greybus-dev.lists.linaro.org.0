Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0839919D
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 19:26:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02DFD60FC3
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 17:26:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 91CDC6079C; Wed,  2 Jun 2021 17:26:35 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CD15E607B2;
	Wed,  2 Jun 2021 17:26:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3E6C260556
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 17:26:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 340546079C; Wed,  2 Jun 2021 17:26:31 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0134.hostedemail.com
 [216.40.44.134])
 by lists.linaro.org (Postfix) with ESMTPS id 26C2860556
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 17:26:29 +0000 (UTC)
Received: from omf07.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9D8DD1801A4E0;
 Wed,  2 Jun 2021 17:26:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf07.hostedemail.com (Postfix) with ESMTPA id 3BA51315D7C; 
 Wed,  2 Jun 2021 17:26:27 +0000 (UTC)
Message-ID: <b54d673e7cde7de5de0c9ba4dd57dd0858580ca4.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft
 <apw@canonical.com>
Date: Wed, 02 Jun 2021 10:26:25 -0700
In-Reply-To: <YLeXoQH2/iJjxkc+@kroah.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <YLeXoQH2/iJjxkc+@kroah.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3BA51315D7C
X-Spam-Status: No, score=-2.90
X-Stat-Signature: puiaqbjzhzyg9p4r5kyjyidreqtawow3
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+8gWow/8EElv5V+Upz4kYDcyBuJjso3/4=
X-HE-Tag: 1622654787-866904
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] checkpatch: Improve the indented label test
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: linux-staging@lists.linux.dev,
 Manikishan Ghantasala <manikishanghantasala@gmail.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

checkpatch identifies a label only when a terminating colon
immediately follows an identifier.

Bitfield definitions can appear to be labels so ignore any
spaces between the identifier terminating colon and any digit
that may be used to define a bitfield length.

Miscellanea:

o Improve the initial checkpatch comment
o Use the more typical '&&' instead of 'and'
o Require the initial label character to be a non-digit
  (Can't use $Ident here because $Ident allows ## concatenation)
o Use $sline instead of $line to ignore comments
o Use '$sline !~ /.../' instead of '!($line =~ /.../)'

Signed-off-by: Joe Perches <joe@perches.com>
---
 
On Wed, 2021-06-02 at 16:37 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 02, 2021 at 07:57:35PM +0530, Manikishan Ghantasala wrote:
> > I agree those are called bit-field member names rather than labels.
> > But the reason I mentioned is because the ./scripts/checkpatch.pl
> > gave out a warning saying "labels should not be indented".
> 
> checkpatch is a perl script that does it's best, but does not always get
> it right.  In this case, it is incorrect, the existing code is just
> fine.

 scripts/checkpatch.pl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d65334588eb4c..6e7d48f412fb7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5361,9 +5361,13 @@ sub process {
 			}
 		}
 
-#goto labels aren't indented, allow a single space however
-		if ($line=~/^.\s+[A-Za-z\d_]+:(?![0-9]+)/ and
-		   !($line=~/^. [A-Za-z\d_]+:/) and !($line=~/^.\s+default:/)) {
+# check that goto labels aren't indented (allow a single space indentation)
+# and ignore bitfield definitions like foo:1
+# Strictly, labels can have whitespace after the identifier and before the :
+# but this is not allowed here as many ?: uses would appear to be labels
+		if ($sline =~ /^.\s+[A-Za-z_][A-Za-z\d_]*:(?!\s*\d+)/ &&
+		    $sline !~ /^. [A-Za-z\d_][A-Za-z\d_]*:/ &&
+		    $sline !~ /^.\s+default:/) {
 			if (WARN("INDENTED_LABEL",
 				 "labels should not be indented\n" . $herecurr) &&
 			    $fix) {

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
