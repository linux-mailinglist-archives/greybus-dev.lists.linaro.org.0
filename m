Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85CC6B4B0
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 19:52:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62B653F910
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 18:52:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 7F3E03F831
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 18:36:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DWTOrEdZ;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7baf61be569so4322570b3a.3
        for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763490970; x=1764095770; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79j4iqbcGQ/T4wx0pyL6Ik5PHIuwtyqnErQphNVBlhk=;
        b=DWTOrEdZ4amizoFxBIu46TZiToiVnixc/xGm9uPxFxxHjE+LV9x+WQ63Bq4GWMbnN5
         iAdV6QIB3E9zyuW/3EqI0xBCAgsiVJtNSRXaACz+MfO6Ix0yA7Pv6xXjHZ6GME/+gLbI
         5N2bLHRbA0sbMCifDZs+puywAQd+nA7ZWASpn8xsKBIjX4FeB0GkcjayEY3Zl49+4bAh
         XzUVZvUlEk7aG58hHF4n85T9OsGI8ngE4li78A1YYrsqslFJCekncjneIyclfeS9uy87
         wFNuLZBJ+sY35hcg/jQxIm1Mn6Hw7C6nQEy4BfQ4b2lDoxQNjzkL3+gMgdPvsAzu7zo1
         wy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490970; x=1764095770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79j4iqbcGQ/T4wx0pyL6Ik5PHIuwtyqnErQphNVBlhk=;
        b=GOZDC9R9sAM2FvZahYpc2KCCb4ONSh/di3IkTAF5JiFYSyEsHHNirDPtLt02e5nnTn
         1l1ZlhjnnSh13OlQKmFRVWN/eQQ+LHHE30QwJK4QbMp0w5gPGD++yT94BFwVrXydXyOc
         SWeLCazcVxRqBsZgrYBr9grnUZE8xNHH2NoggksL/x6kopCVaYQSOAMCb0ZjE01Mk2u0
         1LkxbvZK+kBBpt5yiWmGMKDxjMBLeWdxUI/4qK6LDY7gPV1Co6aoRHC/yQ6b5Fd6VtnK
         ECZ4t3lsAvkl5yoGoHiHWXBO7KdbKuzlVrfUxuRqwSHAFJEqz8ki/v4H0Nu3b+I+G64H
         IbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxm6BYjIvI1icuyOwW2OifhoGE4NcX/vaOyHv3OagsR8RO+bbLW6IKm0ASH1MA+ktmyc7ZvRWRnV7sow==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxa3cewjyfbkCIIWhpXIjy5VhUeZIoqHJogdZ7nhdD1vub4C0z6
	80B0+Bl5x322hqLNPcBVhKDd22cV6VsiW2jXFJFDSpIzO1Z4t/0ptTc4
X-Gm-Gg: ASbGncs1c9mUTWnGRvzpNzLpr2ZIyRCPq09RS9+p6t3sLt9TRFLcOop3xbr7T0ukeVf
	BucESa6Fq5zbousUJMiGTzVz47keqRjzZ7aOvpR5Y/C6wIt31Twhyja8x6qQS/0ZR/YOC/jxf2X
	CoUsehZIhSyQBJC1DCeurJEt8vL45PbXRfKoEC2twK+61Q9s4iIDWx+ufVYbWv4KgNq1NsQpeBc
	u1TOHN52O9STg85Scf3ZDquKSmUuz9KOKJyJrvbTQQ7XFxTbvB9FnahI6cClu3WQ47cLKH77UUH
	reeAulzxvhiQae6xaKiQEQIYJ7PbBnVFWiWdQPXeezkik6PqmB2o3MNNETX6dEkLClr3BVZHpqZ
	wLZZTx/edtsIA/fAVEspi9Zx/dkimJcwTmjNdBDvkbqrjZ7UBtQ9roKekso2nrwmTW76zdmfvDe
	WKIQushWlahVLG
X-Google-Smtp-Source: AGHT+IHa4JRGCsbncxOnBeaVQyIlL5r4RDTWOvg7YK3NBAhwiTWYtCH0KppHR0FS1usI8OZ20uFUtQ==
X-Received: by 2002:a05:6a20:958e:b0:251:43f5:cad4 with SMTP id adf61e73a8af0-35b9fa862f5mr20739767637.10.1763490970504;
        Tue, 18 Nov 2025 10:36:10 -0800 (PST)
Received: from ideapad ([139.5.199.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f52361fsm15893241a12.15.2025.11.18.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:36:10 -0800 (PST)
Date: Wed, 19 Nov 2025 00:06:05 +0530
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: Johan Hovold <johan@kernel.org>
Message-ID: <aRy8lRKzCTNDTc-u@ideapad>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <aRyaoaauQyE78OhX@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aRyaoaauQyE78OhX@hovoldconsulting.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pf1-f172.google.com:rdns,mail-pf1-f172.google.com:helo];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[209.85.210.172:from,139.5.199.64:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7F3E03F831
X-Spamd-Bar: ---
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HJHLHE7Q3R7RKI4K2CLXLASDYCHOAWJW
X-Message-ID-Hash: HJHLHE7Q3R7RKI4K2CLXLASDYCHOAWJW
X-Mailman-Approved-At: Tue, 18 Nov 2025 18:52:41 +0000
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and driver correctness fixes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HJHLHE7Q3R7RKI4K2CLXLASDYCHOAWJW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 18, 2025 at 05:11:13PM +0100, Johan Hovold wrote:
> On Mon, Nov 17, 2025 at 11:48:05PM +0530, Ayaan Mirza Baig wrote:
> > Hi Greg and all,
> > 
> > This series performs a set of cleanups, correctness fixes, and
> > remaining TODO removals across the Greybus drivers in
> > drivers/staging/greybus.
> > 
> > Greybus has existed in staging for a long time, and many FIXMEs,
> > outdated comments, and partial implementations had accumulated over the
> > years.
> 
> These haven't accumulated in staging, but during development as the git
> logs should tell you.
> 
> > While reviewing and compile-testing the drivers I found a number of
> > places where the comments were obsolete, logic was incomplete, or newer
> > subsystem APIs had evolved.
> > 
> > This series addresses those issues without changing any fundamental
> > design or architecture. All changes are self-contained, straightforward,
> > and focues on improving correctness and maintainability.
> > 
> > The patches include:
> > 
> >   * Removal of obsolete FIXMEs that no longer reflect the current code
> >     or hardware behavior.
> >   * Correctness fixes in several protocol drivers (UART, RAW, USB,
> >     Loopback, Firmware core, Audio).
> >   * Small improvements to error handling and shutdown paths.
> >   * Cleanup of commented-out or dead code.
> >   * Removal of the now-completed GPIO and PWM TODO items.
> >   * Removal of the empty Greybus TODO file.
> > 
> > All patches were compile-tested with COMPILE_TEST=y and all Greybus
> > options enabled. Runtime smoke testing was performed where possible.
> > 
> > This series does not attempt to graduate Greybus out of staging; these
> > changes are preparatory cleanups only.
> > 
> > Thanks for your time and review.
> > 
> > Ayaan Mirza Baig (13):
> >   staging: greybus: Remove completed GPIO conversion TODO item
> >   staging: greybus: pwm: move activation into pwm apply and remove
> >     request()
> >   staging: greybus: remove empty TODO file
> >   staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
> >     FIXME
> >   staging: greybus: audio: remove obsolete FIXME and document topology
> >     ownership
> >   staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
> >     event handling
> >   staging: greybus: bootrom: remove obsolete FIXME around firmware
> >     filename logging
> >   staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
> >   staging: greybus: loopback: remove incorrect FIXME about async wait
> >   staging: greybus: raw: handle disconnect while chardev is open
> >   staging: greybus: uart: clear unsupported termios bits
> >   staging: greybus: usb: validate hub control response length
> >   staging: greybus: usb: remove obsolete FIXME about bridged-PHY support
> 
> I only skimmed some of these and there are so many bugs and
> misunderstandings here that I can only imagine what's lurking in the
> remaining ones.
> 
> The basic misunderstanding seems to be that FIXMEs can and should be
> removed without addressing the underlying issues.
> 
> Johan

Hi Johan,

Thank you for taking the time to review the series, and thank you for being
direct about the issues. I want to apologize for the misunderstandings and
for removing FIXMEs that should not have been touched. That was my mistake,
and I should have taken more care before modifying areas of the subsystem
I don't fully understand yet.

I also want to be transparent: I'm an undergraduate student who is just
starting to learn kernel development. I'm very interested in Linux and
want to contribute seriously, but I clearly approached this series with
more confidence than understanding, and I am sorry for the noise that caused.

I'll resend only a very small, focused series once I have properly analysed
the code. Before I send a v2, I want to make sure I am going in the right direction.

If you have any guidance on how I can improve - in terms of approach,
review process, or how to evaluate FIXMEs and TODOs correctly - I would
really appreciate it. I'm trying to learn the right way to contribute and I
don't want to repeat the same mistakes.

I also want to double-check whether the PWM apply() changes (one of the
TODO items) were done correctly, also if there are any issues in
[PATCH 10/13], apart from what Abdun suggested.
I'm willing to redo the work properly.

Again, apologies for the errors. I appreciate your time and feedback.

Thanks,
Ayaan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
