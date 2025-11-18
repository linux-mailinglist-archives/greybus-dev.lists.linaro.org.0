Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B3563C6A867
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 17:11:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D29223F777
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:11:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 4B4AA3F777
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 16:11:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=r04RTVDV;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA4343D82;
	Tue, 18 Nov 2025 16:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD79C4CEFB;
	Tue, 18 Nov 2025 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763482275;
	bh=2R+W0bNW0qaHbH1C5fWHY3FbQ8vbRzdINajKOyRjyvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r04RTVDVEKxJSfcCMmoX9CdCrwGz34qrAgEOWZgvn6iKduDAnLol1yW1Jx8KEhwRG
	 wCyGsXPpd5/GvdDk2Dewcjz8vjVdqT9HYiVvl6VRTInN1gbI738yQFoaFiUEL9PjLE
	 NDM+wIzFlDfNrl0yf5ivov6w6JsPGMe/Bqys2RRjOgdwtXHC2CpUUWN4SBjMfefHLD
	 SQ5q90vtq25UWQYrzw8sP6HdsuayDRhYIXca6cFPGtxUGk/Ga+6rU1iOfejAHYB0Xu
	 ptQsGRHT9duyT+jfSAtcyS/EvqHAu4QnXqieGIf2U9Q7/qvoWYjjo7x85JeGexfNYo
	 XdLN0R9u7nrvg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLOIT-000000003I5-3ll7;
	Tue, 18 Nov 2025 17:11:13 +0100
Date: Tue, 18 Nov 2025 17:11:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyaoaauQyE78OhX@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[sea.source.kernel.org:rdns,sea.source.kernel.org:helo,hovoldconsulting.com:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4B4AA3F777
X-Spamd-Bar: ---
Message-ID-Hash: S55FAYZMLMPDIWNMBYENHZQOUS5ROUXA
X-Message-ID-Hash: S55FAYZMLMPDIWNMBYENHZQOUS5ROUXA
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and driver correctness fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S55FAYZMLMPDIWNMBYENHZQOUS5ROUXA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:05PM +0530, Ayaan Mirza Baig wrote:
> Hi Greg and all,
> 
> This series performs a set of cleanups, correctness fixes, and
> remaining TODO removals across the Greybus drivers in
> drivers/staging/greybus.
> 
> Greybus has existed in staging for a long time, and many FIXMEs,
> outdated comments, and partial implementations had accumulated over the
> years.

These haven't accumulated in staging, but during development as the git
logs should tell you.

> While reviewing and compile-testing the drivers I found a number of
> places where the comments were obsolete, logic was incomplete, or newer
> subsystem APIs had evolved.
> 
> This series addresses those issues without changing any fundamental
> design or architecture. All changes are self-contained, straightforward,
> and focues on improving correctness and maintainability.
> 
> The patches include:
> 
>   * Removal of obsolete FIXMEs that no longer reflect the current code
>     or hardware behavior.
>   * Correctness fixes in several protocol drivers (UART, RAW, USB,
>     Loopback, Firmware core, Audio).
>   * Small improvements to error handling and shutdown paths.
>   * Cleanup of commented-out or dead code.
>   * Removal of the now-completed GPIO and PWM TODO items.
>   * Removal of the empty Greybus TODO file.
> 
> All patches were compile-tested with COMPILE_TEST=y and all Greybus
> options enabled. Runtime smoke testing was performed where possible.
> 
> This series does not attempt to graduate Greybus out of staging; these
> changes are preparatory cleanups only.
> 
> Thanks for your time and review.
> 
> Ayaan Mirza Baig (13):
>   staging: greybus: Remove completed GPIO conversion TODO item
>   staging: greybus: pwm: move activation into pwm apply and remove
>     request()
>   staging: greybus: remove empty TODO file
>   staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
>     FIXME
>   staging: greybus: audio: remove obsolete FIXME and document topology
>     ownership
>   staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
>     event handling
>   staging: greybus: bootrom: remove obsolete FIXME around firmware
>     filename logging
>   staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
>   staging: greybus: loopback: remove incorrect FIXME about async wait
>   staging: greybus: raw: handle disconnect while chardev is open
>   staging: greybus: uart: clear unsupported termios bits
>   staging: greybus: usb: validate hub control response length
>   staging: greybus: usb: remove obsolete FIXME about bridged-PHY support

I only skimmed some of these and there are so many bugs and
misunderstandings here that I can only imagine what's lurking in the
remaining ones.

The basic misunderstanding seems to be that FIXMEs can and should be
removed without addressing the underlying issues.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
