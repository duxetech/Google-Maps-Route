//
//  Customer.swift
//  GMaps
//
//  Created by Karthik on 9/23/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import Foundation



struct Customer : Codable {
    let order : Order
}

struct Order : Codable {
    let customerName : String
    let customerNumber : String
    let routeKey : String
    let lattitude : String
    let longitude : String
    
    enum CodingKeys : String, CodingKey {
        case customerName = "customer_name"
        case customerNumber = "customer_mobile"
        case routeKey = "route_key"
        case lattitude = "customer_lat"
        case longitude = "customer_lng"
    }
}

//Dummy values for drawing route - Chennai to Madurai

let poly = "weznAe{|hNfKnT`BzZfFvh@vRpeC~ClrB_FvuA|f@|_Cf}@l~Bv`A|eAfcAtBtj@zDtb@la@|jA|yA~w@nEd}@l_@b}ApHdfCfGze@`WrQdl@z]hPtf@nc@x~BsLln@hOvxCtgBlqAr_@xwBdbAj~CxyCjrD|xBv|GhlCzbCveB`oCxe@nnBv|Anm@rSxxA_@`q@sLpVr_@bAztApx@zGvaA|f@hoDxlApbElZrfFfpArfA|a@dhAbw@|q@no@zjAzz@|cDfwB|nDleBtxDvqAzb@tu@zwBllBjcAn|@dr@jXnaBjYdz@gJjzAt^ngAtmAziBd{CdfClpFdv@npAvfA`|@n|BrtA~k@cPdrAvf@|QnUiCvnA`n@jd@z`Dn`BrrFrsC~xB~jAtdArhAlzEzeCrcB~b@noDf\\vcBpn@|fBrrBlvBpm@|gA|j@|c@zTdf@~fBnj@to@fZfG`iBkS`~A`q@zn@sA`j@j]|~AvkAzL`i@~{Ap[`lCzh@xwElkBj|DvfC~fBneAv`A|f@vU|f@hjAhpAfjBh|BxbA~pAztAtq@to@xQvPjf@|c@p_BkHtnAvT~k@vj@l~@pkEveHv\\~hBbYfUz`Cp}BrnB|xAjcCxr@bx@`Rzr@hf@~jCrbC`~D`iGhsBxmBprBbtCxlD`kCzt@xRpsArIf|@dcAnaAztAfeAftAz~FrpDlbCteC|aFx|BvuCdLzaCb[vmBfj@loDv~Al{ClpApsAngAzeB`_@~vBd~@boEjr@h}FnoA~rBfm@h}@tw@t}DhbCbqC|iAl_B`Y`k@lSxa@fr@~z@r_Af\\mApLbPdwAll@bpAnj@lbA`r@lcA~Afi@{UrpBcBljE|EbkAdT~^dx@r^xeA|s@lv@bkA`eAvw@p{AxvBlyB~qCpg@`nBdu@`tBbxAznDnsBvfB``Bpw@|}@p^fZpo@xH~bAtYdsArkBteAxt@vjAno@zo@v_A~pBp{@ptAh^|d@`f@z~@hUdaBnqAbxDlnAdz@`RdUf`@|bAl^j{AznAts@|y@ryAbeAbt@zpAhWl`A`}@vQ|iBeWtpAkDruAkTd|BjF~hBfPxw@hP|v@gI~xBkFbqB~Yfs@xj@thAjd@v~@h@rc@gPfkBzd@xvD~g@d{Dzu@`|Dkj@~`BrCh{AzR~wBpTxeCuNtb@|T`Qnl@{a@lqAmAhcBbkAdcCls@|oDvk@h|AbbA`eA`l@vcB|dEjiFjpAvsAfKfe@nOhaB|Its@oPll@{@~]nUpLhB^?f@gGhZ"


let poly1 = "weznAe{|hNdK|`@pDhWfFtgAb]zqCgR|yAjDzmA~t@`jC|d@niAn_@|f@pb@rr@xw@`DnkAbOd{AlnBrmBdb@zkFzXvk@~UtQlm@j_@fQvj@xc@tnBsJtq@h@`}BrdBdaFzhBdbDzyCbgEhjC`vCbnAv{CxnAzrArfA|mApOl`AjRnt@|s@fnB|bAt{ARzu@mLfVja@uGnaArrBvt@f{C|bAjdAp]jaA|Eb|A`JxpFnrAjnAjg@~`Ar{@fuDjpC`~EzwC~yEzxAdq@~^xF`a@bbB~uA~fClmBdcBb[no@uFvpA|LlyAnsAbuBdmD|~ClxGhzC`gCtcAxi@~k@cPjtA|g@rPhYaCjoA|x@~f@|aCtmAdhL~hG`Zph@fz@z`@~}ChcBxfB|d@noDf\\zjBjq@`aBbqBdyBnn@xgAdj@|`@fTrf@tiB|n@xn@dWrDvjBwRzm@fZxjA~O|nApm@b`A~j@tJfg@hPxU`kBd`@deCxi@dcFnrBpeEznCdiBjdAjh@zZzSnk@r{AfaBlhBdqBzNxc@vs@vh@d~Afj@fcAlnC_CneBnIhOfr@liA|gAjgBhaCz{Dj\\~hBtw@tc@rpBz}BdjBzkA~mCpv@ziBbeAvgC|~BjiB~lCfwAhdC`sBjlBb`CnyCheDn_CrzBxSxaAppAncAlwAfkAtgAxtGhkEtfA`uArtAnr@nnBt|@d{At_@poCjLjnCdc@~qB`y@peIrrDl[|b@|r@bQxxBnm@vwB~o@rmBpRd_GlzAvtBnc@`sAtcAhyDb`CpqCrlAbzArWpr@fRxZtd@lgAjrAj[uAfPhU~{Ajj@drAzn@hv@li@jy@`Cvs@aRdhCgEdhF~P~o@dWrMl`Avn@zz@jWle@pnAjeAft@vyAhqAhqA`t@`q@hbB|WhvBxi@`uBd{Az`EfbCp_BrkAty@ncA~cAjs@jvApVjoA|mBbiAlv@`iApj@hr@py@lT|^bwA`i@r}Ah^v^hc@baAtVfbBhrAvuD`pA~}@pPhVn`@lcAh^noC~iClzA~dAfu@nqAlUl|@hZ|QxpA|@jx@yR|qA}CvtA_T|}BhEbjBzOpmBrFp}ByFbqB~Yfs@xj@xiApd@`tB{Mh`Bdi@~yDvc@nqBjh@loA`HlbEul@`uArMvkBlSdw@bSv_AeGb{BmCvZl[`E~v@gg@xvAiAzi@rSni@rh@~iAn[xx@r`A|~DbjBhaD~Ivk@ny@`jA||EzdG|ZpWfGlv@fN|oApD`d@R^kAlGeUbv@hVlVvFtBRLuDv_@aBsC"

let poly2 = "_egnAgo_hNCWDe@BSj@DrAFlAD|A@fFJbDJ~FNbBHlC\\pWtEdMzBnCTrADdEKnFOlGM\\AzA?|BK~AIzBG|JQjKS`EKvEE|EF~GDnHLnCLp@Jx@N`Bf@p@XrAt@p@b@b@b@r@r@d@l@rAfChBD|Gh@xO~@~Gb@`ERrI`@lBFt@PdAb@^XVV`@l@P`@TTPPv@XfBv@r@^~@\\XJx@RfBHb@BdCVzDb@hCZxEt@|@Rt@Hj@?hCZ~@J^AbC]x@?`@FrJzBVFBFh@I|Du@dASj@Qn@bAbBA~B@bA@pGV`E`@x@cJj@}FH_Aa@k@CWDGHKNGT@Ze@L_@TsA`@uCh@uDN{BDiELiBJoC`@eUBuCVgMR"
