Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC774FC2A4
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 18:43:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ACB94402C3
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 16:43:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id 9044D3EBCC
	for <greybus-dev@lists.linaro.org>; Tue, 29 Mar 2022 02:04:06 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id t5so14552984pfg.4
        for <greybus-dev@lists.linaro.org>; Mon, 28 Mar 2022 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o1C/N7k3NvBFr+UwK4x8b6ScN+zhLx3X20kO3wGJzGs=;
        b=egQ2/hWe4My+5CfAHOVi0oWqZnTHksJedoVcn4yJ53m9qW9FCmzt7gzVcCIeua6Ghb
         aO+RE19WOQDk253DKTfg5uN8MyJINd8wNIWXksmYAB2LHh28siew51lOd/KQ5JpGgle7
         Jo7Blz1iIcnR3gB4nRS0XcXoebulkpnN5l+AJDa49biNQVT9T+joNrK309Ny2/OKDrs+
         J5Vwm/maFYIHB/RYQxOwnokJUr2AKfow1Up4/2WuTRh51IlDQSTuYlMVqgl4BoK5MzbB
         83SpAq6gJOsKDbxgIhPjkphgovNFhP/QSEFk5AC3qCoO98I+/McDXk8rwoAnkKj4RuSM
         7iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o1C/N7k3NvBFr+UwK4x8b6ScN+zhLx3X20kO3wGJzGs=;
        b=d4fW3gSNK9f1CKi7LT3DsOXruSF0tUz4jBFsagnBi636Cu4ClZPrRYEOD9oTiGI5Yv
         wLHVKRCgc1sTpdrMvLiRjKyGGWF1+FdfuW9QfWzvkaAmugODAvM1UkhWUrYPI8UHyT8S
         YKZtVx4n4TutnLoJ6pkffylIQ/8SsgH7/YChvoz10CzRj6MMLQm/wG+OGjxcY9EODfAa
         DfKNW38T9ZuFyS37P4m4bHk4Xwg+SRZWlp3fXwqY3buqGC1/ftmUE/LhhrY2zq7DENuM
         CcSHiz9gzP/qqX/sz6w9X1j9OEkHsPZrmwgFO1quCPR7A44cHxB1Oe2WU+hzSgLzqtml
         Uerw==
X-Gm-Message-State: AOAM5333EjcEQaAviJWz/ktpqf3p4Z8mKDI3DuyvZHm5A1/zw07Z6bhE
	wnqV6enh+kemUTvLBC5k/h0=
X-Google-Smtp-Source: ABdhPJxWSoZfrbImbacBCV9Yd4RuUQFxxhBKS47gx0JNznRDIgWtbVrXzE1W6vSRE2UP9qzs2CXo4w==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id l10-20020a056a00140a00b004e054d50d01mr25768620pfu.20.1648519445808;
        Mon, 28 Mar 2022 19:04:05 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id c4-20020a056a00248400b004faad8c81bcsm18203488pfv.127.2022.03.28.19.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 19:04:05 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: dan.carpenter@oracle.com
Date: Tue, 29 Mar 2022 10:03:57 +0800
Message-Id: <20220329020357.10597-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328141944.GT3293@kadam>
References: <20220328141944.GT3293@kadam>
X-MailFrom: xiam0nd.tong@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PQLYWVGNJIWVQIUUSAGNHBKXX46WZZPV
X-Message-ID-Hash: PQLYWVGNJIWVQIUUSAGNHBKXX46WZZPV
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:43:14 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, stable@vger.kernel.org, xiam0nd.tong@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio_codec: fix three missing initializers for data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PQLYWVGNJIWVQIUUSAGNHBKXX46WZZPV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 28 Mar 2022 17:19:45 +0300, Dan Carpenter wrote:
> On Sun, Mar 27, 2022 at 02:01:20PM +0800, Xiaomeng Tong wrote:
> > These three bugs are here:
> > 	struct gbaudio_data_connection *data;
> > 
> > If the list '&codec->module_list' is empty then the 'data' will
> > keep unchanged.
> 
> All three of these functions check for if the codec->module_list is
> empty at the start of the function so these are not real bugs.
> 
> Smatch is supposed to be able to figure this out, but apparently that
> code is broken so Smatch still prints a warning.  :(
> 
> Apparently GCC does not print a warning for this.  Even when I delete
> the check for list_empty() then GCC does not print a warning.  GCC often
> assumes that we enter loops one time.  I haven't looked at that, but I
> have noticed it in reviewing Smatch vs GCC warnings.
> 
> Generally we do not apply static checker work arounds.
> 
> I do not have a problem with this particular work around, but it needs
> an updated commit message which says it is just to silence static
> checker warnings and not to fix bugs.  Remove the Fixes tag.  Don't CC
> stable.

Yes, you are right. I have resend a PATCH with updated commit message as
you suggested, and cc you. Thank you.

--
Xiaomeng Tong
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
