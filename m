Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 12259C696C0
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:38:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 31AEF3F918
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:38:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id 014BF3F72F
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:19:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="iq9q/Nl2";
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.172 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297f35be2ffso65509245ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403580; x=1764008380; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUOOg5GGpzYO8NO3IORlT4sSo1VnzPUM2UrBOqz/zBU=;
        b=iq9q/Nl2y1XaiM1P//RUlE3gTF68ovVVWiQ6OdZsfcJnXjYn+frrDPoMUeiI8ODuP5
         yBdIajdGLhHcq7sGk126/4XG5nXJgMVCVEDCafP7dYs0GeX2CLGUyvGyXurXexq+gXAi
         OCVasPC0smyYrdtOTbanCnhS0T3A8jhSY7fmOIshcXE8hJsuzYrM6ghCI3S6IzACHVXr
         vUf2EYZ/zoZ+Ni5IIuJ1SE6QgsTJ98yblR2Y9/84JJ5icCfvbmYVSXyBNk7dbukSFK32
         tf4pTfi8PDtl8Dwu0N/T7yKnq8vlnbD2Vv4J1ZJ02eda5Prk8lCquMUWVmCtGsKF04mf
         y8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403580; x=1764008380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUOOg5GGpzYO8NO3IORlT4sSo1VnzPUM2UrBOqz/zBU=;
        b=kQWIDl9MTOcrl0XqqEn31m0MEH4j7LRpMPTrf6VJJxWYQkCRyJd9CULOutJ92+M3dN
         njza2AuMMReXbXgwTpAY6gUgz8zL0Rz4DCAV82i5LGciTKw5ctz2uDxkD7dryxECo6Fv
         i6oLewcfyV4OC6m8R8CnzAdrTMbM/YeJv+mCyaDKVKMPKg9lbPxlatnObFfRApLSG770
         aHglVItSsHceYgp4DX9vvrfMg9dZGEHtorNmSgF6plCBVP8HRSOuWPOi6yA2aU4np1Ni
         DqHcNptykWBYQyoCmkKzFksKj+UGVwWXjNHvvBZhUfqqjDIwZa30l5QT3S4Bc0RJB3WE
         RHaw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0Iq5SC9SVXPTL+PSBEOcxDIEfaMhCUaPk6WqBrSTZ5Ii5e9WggzhCEbdeZPhIjdoqS7dAfkjE4NaNg==@lists.linaro.org
X-Gm-Message-State: AOJu0YybPry7iWeVg1IZjtkg171JixI6fijRhPYqLzrS9lbfyjpgAzwd
	edxZfHgn6sNVlNgfbTG7mnrb7HEAAtXsfeJmIc/llYkEvjpiCoNU5ZVF
X-Gm-Gg: ASbGnctAD8tva0GXKVTillS+KrQvj/Nj4zzBqKV/DLPVsO7L59ExrGp+KF2SyVe/Gbr
	+1qf21/IX4wvMjXQggmN4lXxqFNuYWwLyg7cIJ4DhIKJ+CEeSmk+h3hoHWF3BmGUvf80v/SCINX
	IQE2LckwGhM1RUcuCmzkVCPidWTbYagL0CINTJYqg9vq1RpKQnVReYKQo42W5GvgC3/n99sLpei
	OSGVfOLFfdKSlWDYvwKNpopQZySXOSf+18uOIUqAtUvlYhqoCryhekh2z4ooZuV2xZZaGruBjn5
	3tJoIaZQUobaama8qG6D90FFfZKk6oQOwjVPcB9QMps8hrZR4S6/NlsD4NwsZ22vnwAq9W9kazk
	Cliva3vThu2KEFWYcsIvlOat1jv8kbHZB0CIEjKcHVFrw2Y832Nf0jcHR18LwgF2Bti7er+Vnwx
	jvzFkMpgKK7ReiGdEIbueDl8LtbjNMOjZ6jCgUgMR21/W4Zcg=
X-Google-Smtp-Source: AGHT+IGBjDcTPMPHmmSbsyNWObzCORlsuM07yRKYVKXMPdwZOGMYJBb41kCMiHZnlJGfPjcHpqClNw==
X-Received: by 2002:a17:902:f712:b0:258:f033:3ff9 with SMTP id d9443c01a7336-2986a755ac2mr164015855ad.48.1763403579828;
        Mon, 17 Nov 2025 10:19:39 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:19:39 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:05 +0530
Message-ID: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.172:from];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 014BF3F72F
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5GF7YFTELJVHWWQCT6F3NVNISYXVY3YB
X-Message-ID-Hash: 5GF7YFTELJVHWWQCT6F3NVNISYXVY3YB
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:33 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and driver correctness fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5GF7YFTELJVHWWQCT6F3NVNISYXVY3YB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Greg and all,

This series performs a set of cleanups, correctness fixes, and
remaining TODO removals across the Greybus drivers in
drivers/staging/greybus.

Greybus has existed in staging for a long time, and many FIXMEs,
outdated comments, and partial implementations had accumulated over the
years. While reviewing and compile-testing the drivers I found a number of
places where the comments were obsolete, logic was incomplete, or newer
subsystem APIs had evolved.

This series addresses those issues without changing any fundamental
design or architecture. All changes are self-contained, straightforward,
and focues on improving correctness and maintainability.

The patches include:

  * Removal of obsolete FIXMEs that no longer reflect the current code
    or hardware behavior.
  * Correctness fixes in several protocol drivers (UART, RAW, USB,
    Loopback, Firmware core, Audio).
  * Small improvements to error handling and shutdown paths.
  * Cleanup of commented-out or dead code.
  * Removal of the now-completed GPIO and PWM TODO items.
  * Removal of the empty Greybus TODO file.

All patches were compile-tested with COMPILE_TEST=y and all Greybus
options enabled. Runtime smoke testing was performed where possible.

This series does not attempt to graduate Greybus out of staging; these
changes are preparatory cleanups only.

Thanks for your time and review.

Ayaan Mirza Baig (13):
  staging: greybus: Remove completed GPIO conversion TODO item
  staging: greybus: pwm: move activation into pwm apply and remove
    request()
  staging: greybus: remove empty TODO file
  staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
    FIXME
  staging: greybus: audio: remove obsolete FIXME and document topology
    ownership
  staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
    event handling
  staging: greybus: bootrom: remove obsolete FIXME around firmware
    filename logging
  staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
  staging: greybus: loopback: remove incorrect FIXME about async wait
  staging: greybus: raw: handle disconnect while chardev is open
  staging: greybus: uart: clear unsupported termios bits
  staging: greybus: usb: validate hub control response length
  staging: greybus: usb: remove obsolete FIXME about bridged-PHY support

 drivers/staging/greybus/TODO           |  5 -----
 drivers/staging/greybus/audio_codec.c  |  7 +------
 drivers/staging/greybus/audio_module.c |  6 ++++--
 drivers/staging/greybus/bootrom.c      | 10 ++--------
 drivers/staging/greybus/fw-core.c      |  4 ++--
 drivers/staging/greybus/loopback.c     |  6 +-----
 drivers/staging/greybus/pwm.c          | 19 +++++++++++--------
 drivers/staging/greybus/raw.c          | 18 ++++++++++++++++--
 drivers/staging/greybus/uart.c         | 10 ++++++++--
 drivers/staging/greybus/usb.c          | 23 ++++++++---------------
 10 files changed, 53 insertions(+), 55 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO

-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
