Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CE890112
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 15:05:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0B5C54437C
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 14:05:37 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id D158540B91
	for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 14:05:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="YSIBj/z8";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=arnd@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1488ACE2B46;
	Thu, 28 Mar 2024 14:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2767DC433F1;
	Thu, 28 Mar 2024 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711634730;
	bh=DyPPajVzJsQEhnad3V3XmULXNURr7x/hE7W3jpIhYHU=;
	h=From:To:Cc:Subject:Date:From;
	b=YSIBj/z8FiuLEgDqBHCsbNl9cmMUDFKkjhDyPYeuiZwdnRhaWzQB1qy5bUc+cEoyn
	 TgUgizmrgNHaRrJXrUOrR+GdgNy6Jcz8XE1oOPfSpaFhiEmf4RgxaXmRRkMfBs3XvJ
	 Wdamgkwsoalajey9FhYVrBXHHnDc3hfmz1/sXLzA38s+j7m8rRsVIbogv2merkfHvl
	 7NGUhSAkFPNi5a9tOFYSVMmfUJIhgs6J2mztKYfkmZfdJyHIxoNs7A5AsNpAjEutO0
	 MTG5hno3yJ9IL2S3wchli/Txbu6/jMN5FjWKlXiRfuxNfq/iu1yN/a5CzMTTL577iG
	 hodYTkkA1QuNg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 28 Mar 2024 15:04:44 +0100
Message-Id: <20240328140512.4148825-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: D158540B91
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[37];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: XCJAMNWCMSKA5ZMHAFWGT66AVLP5N3IL
X-Message-ID-Hash: XCJAMNWCMSKA5ZMHAFWGT66AVLP5N3IL
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <lenb@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Kees Cook <keescook@chromium.org>, Alexey Starikovskiy <astarikovskiy@suse.de>, linux-ntfs-dev@lists.sourceforge.net, linux-b
 lock@vger.kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, linux-scsi@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/11] address remaining stringop-truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XCJAMNWCMSKA5ZMHAFWGT66AVLP5N3IL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

We are close to being able to turn on -Wstringop-truncation
unconditionally instead of only at the 'make W=1' level, these ten
warnings are all that I saw in randconfig testing across compiler versions
on arm, arm64 and x86.

The final patch is only there for reference at the moment, I hope
we can merge the other ones through the subsystem trees first,
as there are no dependencies between them.

     Arnd

Arnd Bergmann (11):
  staging: vc04_services: changen strncpy() to strscpy_pad()
  scsi: devinfo: rework scsi_strcpy_devinfo()
  staging: replace weird strncpy() with memcpy()
  orangefs: convert strncpy() to strscpy()
  test_hexdump: avoid string truncation warning
  acpi: avoid warning for truncated string copy
  block/partitions/ldm: convert strncpy() to strscpy()
  blktrace: convert strncpy() to strscpy_pad()
  staging: rtl8723bs: convert strncpy to strscpy
  staging: greybus: change strncpy() to strscpy()
  kbuild: enable -Wstringop-truncation globally

 block/partitions/ldm.c                        |  6 ++--
 drivers/acpi/acpica/tbfind.c                  | 19 +++++------
 drivers/scsi/scsi_devinfo.c                   | 30 +++++++++++------
 drivers/staging/greybus/fw-management.c       |  4 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  5 ++-
 drivers/staging/rts5208/rtsx_scsi.c           |  2 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  4 +--
 fs/orangefs/dcache.c                          |  4 +--
 fs/orangefs/namei.c                           | 33 +++++++++----------
 fs/orangefs/super.c                           | 16 ++++-----
 kernel/trace/blktrace.c                       |  3 +-
 lib/test_hexdump.c                            |  2 +-
 scripts/Makefile.extrawarn                    |  1 -
 13 files changed, 64 insertions(+), 65 deletions(-)

-- 
2.39.2

Cc: "Richard Russon
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Robert Moore <robert.moore@intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Len Brown <lenb@kernel.org>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>
Cc: Alexey Starikovskiy <astarikovskiy@suse.de>
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: devel@lists.orangefs.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
