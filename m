Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIhtFlb49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:38 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CA4AEFF4
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 093D84096F
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:37 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 33A583F774
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 16:46:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fUK2IEBr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of shyamsunderreddypadira@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=shyamsunderreddypadira@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1215975f8f.2
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 09:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777653970; cv=none;
        d=google.com; s=arc-20240605;
        b=OJdi/NvIPdXnvYfDlcut/NrfeOvBaP6vb6dX8L4YFZVffyC+afTYGgiXMHNTO0foMi
         foPTUAnyjYYBWZWHUTEzFnJENcmVh/DpaGNN5YhZD5qWQYMZ2WxkfRl1rqZXThFSZr0M
         Bk/Who9fWwiSCxywhOqu0pl/AfBXgymdaeFBqEKc4C1+Hj2CsVVhEinWndOxFwz2FmQU
         lOXeGSml15GHGMYSO724h6tjuMAdkbNMdioQaNotiNPXq5365mXSzn6bA66CRSDGcagf
         CbuTAGj1JJVqQP1Z/0oNIZva++pFlnS1uu0z9UoUoFN5NQQJexWb94dlRoR9wKZAqDQ5
         gvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        fh=lE8JE3CMHDdJZbzrdR9oWc1wRcfuv0QoPfI01v2IK6Y=;
        b=j8S4l0TUPPXMEi42Y83kwb4Fe3BYbLxI/bJ+/u2gFOeFR4hjvUl/1HQNHeugXAVUh+
         wZpzPYZdBLuClluPTwbfUNnsjCHK2ValkPUKn3WOpZr8TJCgBhl8RKxzCkPFBcaP2uVZ
         QAewKctXuKP7Q4ReIerK2mcZx/v0NHqezuD2eYtoSjCzdm4YxEruLwyuhaqSj6hrFQP8
         kiDkaZuuiIjp1Q12q5/P7s6frvXVxK8HBhAJmTLZk7WINDu4Zw9O9RdpFO5Az2H5c90t
         ryrqzsiyhdafdNeMMYk5Zws81Bq439kbyqnQ9GG3xncGSRSKDm+w0rSKBOzAOclZQ6Df
         12aA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777653970; x=1778258770; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        b=fUK2IEBrbkvDgMxbKavHEgNJqsbH3w9KQBGQ1Jif5z+FLAPJ3PW7zivdq5YdnPFxmz
         BpwLU6IMv0lB2xVt1MVMfRtor/IwIZuiTTw6tFxLHN3gYHG6iTrrU2eFWoSFLSOQJmvJ
         /JhHmqpLOG2PCPzmxg+UeTrERltc2wjE2GBMQFdTReqoA5VBlqFe4Sh4O3iAcMQJyTq/
         uRiGRyiDXQB/SqZuXfdetmoB329sl0QlQiBnRHWLjKPjOl4lnI/2ljhrxUoX1zjaTXRs
         UUM+lAiYfRukvrBJ3BaqEojGlzweuGPtO1C5vSCoqmAVzR04aApbiKH+eJzq4YZLXrKb
         mmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653970; x=1778258770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXHHFreHFO4FZPo/mLdO1Bk9i7x2o4FNWOox9e9dDtU=;
        b=B2fvzqnyn/dSFPjQiiTtGor9N2TuzHKFzjVxt7ecF8nJoRb0vjDFAlTyI4ivvUv7Th
         Yef6l3+lVeFPX7aBueT7twHFXSTDOGbDI5Ed0Oz3nNG+ehRwooIV65mPeXlyGH6On/AN
         3mJ+3doVVcznO+fRghB77nbQSy5NRbajnUIuF/Fin5LJO0Yc37ZJnMzuRGb73q5SI7EH
         BK5M9KpYQFChcplGSnRz9vKoTa+oGXpobfbjC6ZMbdY1fBPb/c8s9IJs4WFcGokjzivi
         P0s0Tn9WS0HA4VUNBG5GaVQWLQINzZ81fwU5ZeyEuvi8lnQxzisDP8hYI2S010oeodoM
         j1Rg==
X-Forwarded-Encrypted: i=1; AFNElJ/lLBpH2Nir3CyV6ipPOCvCkOc5ZwO+r+rGM2p1YAo8RiXH183FGMAc3rJ66iizwLigshO5af+dR+lKWw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz8rSTSIs0CBugtuEDZ1pfH6WbJw3dB7xrSdI1n9S7Kp8u5NSSv
	AuXVyO/5BQJzjtnuJDhJDF5y4T9DF63J/ViekUpinoqYIZkio8lITzpll6qqsh+2mA5NNhB26Rz
	gqX4VPn5pfN6Jkb2EOGJexcQx5Cg4DTk=
X-Gm-Gg: AeBDiesf8xx4WgKjCbmGMvCFRbTek8Qi9AK3YEgPdvq6d1R5LMzUjHQvz8YQcKQunQR
	79i8+sumSnZA2V7m9AEEiRKzf4lsvrbaDs6K0C4Ff1MRoT9ITE6DxsIj6+3ipj7WBnwLpxOv2Rw
	2HINHO6lLnWjnNXiyvfc2oj40kStD8wb1XH+WGYWoJ08HcDPQ2EPwZQKhURegLZPY0xQnVSliYn
	6CE8NxAFHSVidQDvcv4dtZxEBFfptXpW1G9kVb6laFMRpF/V2c0hBEff4oDKzdFgRCZP5LMI++E
	l2ANE+o5ocznS/aVpYzp
X-Received: by 2002:a05:6000:2c05:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-44bb32fcde4mr326857f8f.11.1777653969901; Fri, 01 May 2026
 09:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com> <afTQZHlmMkTZDP2H@stanley.mountain>
In-Reply-To: <afTQZHlmMkTZDP2H@stanley.mountain>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Fri, 1 May 2026 22:15:57 +0530
X-Gm-Features: AVHnY4JSqeJoxbab_SXuuBIl1KV49DQVjFIS99H8JSV6tpKtX8p8ZMz-3U8mLiA
Message-ID: <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: shyamsunderreddypadira@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WPE6CST7EEDZYJD5Z3TF5UUMGIGO4TF3
X-Message-ID-Hash: WPE6CST7EEDZYJD5Z3TF5UUMGIGO4TF3
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:52 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WPE6CST7EEDZYJD5Z3TF5UUMGIGO4TF3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0D1CA4AEFF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid]

Hi Dan Carpenter

I have not been able to test this on hardware. I based this change on
the standard sysfs formatting requirement as documented in
Documentation/filesystems/sysfs.rst.
If there is a concern that specific Greybus userspace tools are
sensitive to the trailing newline, I can withdraw the patch. However,
this change aligns the driver with the standard sysfs formatting used
across the kernel.

Best Regards
Shyam


On Fri, 1 May 2026 at 21:40, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, May 01, 2026 at 08:12:08PM +0530, Shyam Sunder Reddy Padira wrote:
> > Sysfs show() functions should return newline-terminated
> > strings.Add missing newline to sysfs_emit() format string.
> >
> > Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> > ----
> > v2:
> > -Remove "no functional changes" from the description as per
> > Greg's feedback.
>
> How do you know this doesn't break anything?
>
> regards,
> dan carpenter
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
